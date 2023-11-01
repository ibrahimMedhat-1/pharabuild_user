import 'package:flutter/material.dart';

import 'widgets/chat_list_item.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        surfaceTintColor: Colors.white,
        title: const Text('Chats'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => const ChatListItem(),
        itemCount: 10,
      ),
    );
  }
}
