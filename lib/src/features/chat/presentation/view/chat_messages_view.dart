import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/contact_model.dart';
import '../../domain/message_model.dart';
import '../controllers/chat_messages_controller.dart';
import '../widgets/chat_message_input.dart';

class ChatMessagesView extends HookConsumerWidget {
  const ChatMessagesView({Key? key, required this.contact}) : super(key: key);

  final Contact contact;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Message>> chatList = ref.watch(
      chatViewControllerProvider(
        contact,
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            chatList.when(
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              data: (data) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(data[index].message),
                  ),
                );
              },
              error: (error, stackTrace) {
                return const Center(
                  child: Text('Uh oh. Something went wrong!'),
                );
              },
            ),
            const ChatMessageInput()
          ],
        ),
      ),
    );
  }
}
