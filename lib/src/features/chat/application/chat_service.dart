import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/chat_model.dart';
import '../domain/contact_model.dart';
import '../domain/message_model.dart';

/// Service for chat specific actions.
class ChatService {
  ChatService(this.ref);
  final Ref ref;

  /// Checks devices internet connection.
  Future<void> _connectionStatus() async {}

  /// Encrypts chat with users and contacts MEKs.
  Future<void> _encryptChat(Chat chat, List myMEK, List contactMEK) async {}

  /// Decrypts data with users MDK.
  Future<void> _decryptChat(encryptedChat, List myMDK) async {}

  /// Saves a MEK on the users UP.
  Future<void> setMEK(String myUP) async {}

  /// Checks and retrieves a MEK on the contacts UP.
  Future<void> getMEK(String contactUP) async {}

  /// Creates an orbitDbChatRepo for user.
  Future<void> setOrbitDbChatRepo(String contactUP) async {}

  /// Listens on pubsub for contacts orbitDbChatRepo.
  Future<void> getOrbitDbChatRepo(String peerId) async {}

  /// Gets the decrypted chat.
  Future<List<Message>> getChat(Contact contact, {bool? getLocal}) async {
    throw UnimplementedError();
  }

  /// Saves the users message into their orbitDbChatRepo.
  Future<void> setMessage(Message message) async {
    throw UnimplementedError();
  }
}

final chatServiceProvider = Provider<ChatService>(
  (ref) {
    return ChatService(ref);
  },
);
