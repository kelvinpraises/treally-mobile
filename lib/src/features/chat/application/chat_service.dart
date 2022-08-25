import '../domain/chat_model.dart';

class ChatService {
  ChatService(this.ref);
  final Ref ref;

  Future<Chat> _fetchChat() {
    throw UnimplementedError();
  }

  Future<void> _setChat(Chat cart) {
    throw UnimplementedError();
  }

  /// Adds an encrypted chat to the hive and orbitDb.
  Future<void> addMessage(Item item) async {
    final chat = await _fetchChat();
    final updated = chat.message(item);
    await _setChat(updated);
  }

  /// Removes a encrypted message from chat object in hive and orbitDb.
  Future<void> removeMessage(Item item) async {
    final chat = await _fetchChat();
    final updated = chat.remove(item);
    await _setChat(updated);
  }

  //getEncryptionKeys
  //getTime
}
