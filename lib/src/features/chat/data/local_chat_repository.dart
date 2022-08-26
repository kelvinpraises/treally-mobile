import '../domain/chat_model.dart';

class LocalChatRepository {
  // get the chat value (read-once)
  Future<Chat> fetchCart() {
    throw UnimplementedError();
  }

  // get the chat value (realtime updates)
  Stream<Chat> watchCart() {
    throw UnimplementedError();
  }

  // set the chat value
  Future<void> setChat(Chat chat) {
    throw UnimplementedError();
  }
}
