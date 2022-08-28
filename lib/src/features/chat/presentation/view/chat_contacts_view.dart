import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatContactsView extends HookConsumerWidget {
  const ChatContactsView({Key? key}) : super(key: key);

  static const routeName = '/chats';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Expanded(
              child: Container(),
            ),
          )
        ],
      ),
    );
  }
}

// TODO: add contacts here
