import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/chat_service.dart';
import '../../domain/contact_model.dart';
import '../../domain/message_model.dart';

class ChatViewController extends StateNotifier<AsyncValue<List<Message>>> {
  ChatViewController({required this.contact, required this.chatServiceProvider})
      : super(const AsyncLoading()) {
    _initChat(contact);
  }

  final Contact contact;
  final ChatService chatServiceProvider;

  List<Message> _filterByTime(List<Message> message) {
    throw UnimplementedError();
  }

  Future<void> _pollContactChat() async {}

  Future<void> _pollPeerIdPubSub() async {}

  /// Loads all messages in chat when class is initialized.
  Future<void> _initChat(Contact contact) async {
    // Check if the contact has no messageEncryptionKey on UP.
    if (contact.messageEncryptionKeys?.isEmpty ?? true) {
      throw ErrorDescription(
        'Contact does not support messaging; No "Message Encryption Key" on profile',
      );
    }

    // Check if "mine" orbitDbChatRepo doesn't exist on contact.
    // Create and send details over pubsub "peerId" channel.
    if (contact.orbitDbChatRepo?.mine == null) {
      chatServiceProvider.setOrbitDbChatRepo(contact.contactUniversalProfile);
    }

    // Check if "contact" orbitDbChatRepo exists on contact.
    // Pub db details and sub for contact db details on "peerId" channel.
    if (contact.orbitDbChatRepo?.contact == null) {
      _pollPeerIdPubSub();
    }

    // Get decrypted chat from orbitDbChatRepo.
    final myChat = chatServiceProvider.getChat(contact);
    final contactChat = chatServiceProvider.getChat(contact);

    // If contact has orbitDbChatRepo poll for new data.
    if (contact.orbitDbChatRepo?.contact != null) {
      _pollContactChat();
    }
  }

  /// Loads all messages in chat when class is initialized.
  Future<void> _loadChat() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final myChat = await chatServiceProvider.getChat(contact);
      final contactChat = await chatServiceProvider.getChat(
        contact,
        getLocal: true,
      );

      final combinedList = [...myChat, ...contactChat];

      final filtered = Future(() => _filterByTime(combinedList));
      return filtered;
    });
  }

  /// Adds a new message to the chat.
  Future<void> addMessage(Message message) async {
    await chatServiceProvider.setMessage(message);
    _loadChat();
  }

  /// Deletes a message from the chat.
  Future<void> deleteMessage(String message) async {
    _loadChat();
  }
}

StateNotifierProvider<ChatViewController, AsyncValue<List<Message>>> Function(
        Contact contact) chatViewControllerProvider =
    (Contact contact) =>
        StateNotifierProvider<ChatViewController, AsyncValue<List<Message>>>(
          (ref) => ChatViewController(
            contact: contact,
            chatServiceProvider: ref.watch(chatServiceProvider),
          ),
        );
