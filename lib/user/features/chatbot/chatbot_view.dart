import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/shared/utils/icons.dart';
import 'package:intelligent_pharmacy/user/features/chatbot/widgets/chat_bubble.dart';

import '../../../shared/styles/colors.dart';
import 'manager/chatbot_cubit.dart';

class ChatBotPage extends StatelessWidget {
  const ChatBotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatbotCubit(),
      child: BlocConsumer<ChatbotCubit, ChatbotState>(
        listener: (context, state) {},
        builder: (context, state) {
          ChatbotCubit cubit = ChatbotCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage(IconsAsset.chatBotLogo),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  const Text("Chatbot"),
                ],
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.chatMessage.length,
                    itemBuilder: (context, index) {
                      final message = cubit.chatMessage[index];
                      return ChatBubble(
                        text: message.text,
                        isUser: message.isUser,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: TextField(
                      controller: cubit.messageController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Send Message",
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.sendMessage(cubit.messageController.text);
                            cubit.messageController.clear();
                          },
                          icon: const Icon(Icons.send),
                        ),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: ColorsAsset.mainColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
