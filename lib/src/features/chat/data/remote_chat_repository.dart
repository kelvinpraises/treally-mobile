import '../domain/chat_model.dart';

class RemoteChatRepository {
  // get the chat value (read-once)
  Future<Chat> fetchChat() {
    throw UnimplementedError();
  }

  // get the chat value (realtime updates)
  Stream<Chat> watchChat() {
    throw UnimplementedError();
  }

  // set the chat value
  Future<void> setChat(Chat chat) {
    throw UnimplementedError();
  }
}
