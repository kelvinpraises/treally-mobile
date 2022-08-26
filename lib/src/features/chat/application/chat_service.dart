
import '../domain/chat_model.dart';
import '../domain/message_model.dart';

/// Service for chat specific actions.
class ChatService {
  ChatService(this.ref);
  final Ref ref;

  Future<Chat> _connectionStatus() {
    throw UnimplementedError();
  }

  Future<Message> _encryptMessage(Message message) {
    throw UnimplementedError();
  }

  Future<Chat> _decryptChat(Chat chat) {
    throw UnimplementedError();
  }

  Future<Chat> _fetchChat() {
    throw UnimplementedError();
  }

  Future<void> _setChat(Chat chat) {
    throw UnimplementedError();
  }

  /// Gets the chat from hive or orbitDb.
  Future<void> getChat() async {}

  /// Adds an encrypted chat to the hive and orbitDb.
  Future<void> addMessage(Message message) async {
    final chat = await _fetchChat();
    final updated = chat.message(item);
    await _setChat(updated);
  }

  /// Deletes an encrypted message from chat object in hive and orbitDb.
  Future<void> deleteMessage(Message message) async {
    final chat = await _fetchChat();
    final updated = chat.remove(item);
    await _setChat(updated);
  }
}
