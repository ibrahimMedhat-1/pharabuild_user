import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/features/chat/manager/chat_page_cubit/chat_page_cubit.dart';
import 'package:intelligent_pharmacy/features/chat/view/widgets/receiver_message.dart';
import 'package:intelligent_pharmacy/features/chat/view/widgets/sender_message.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatPageCubit(),
      child: BlocConsumer<ChatPageCubit, ChatPageState>(
        listener: (context, state) {},
        builder: (context, state) {
          final ChatPageCubit cubit = ChatPageCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Ibrahim Medhat'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => cubit.messages[index].sender == 'patient'
                          ? SenderMessage(message: cubit.messages[index])
                          : ReceiverMessage(message: cubit.messages[index]),
                      itemCount: cubit.messages.length,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Type your message',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
