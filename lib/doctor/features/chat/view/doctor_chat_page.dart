import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/models/chat_user_model.dart';
import 'package:intelligent_pharmacy/shared/utils/constants.dart';

import '../../../../models/message_model.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../user/features/chatbot/view/widgets/chat_bubble.dart';
import '../manager/chat_cubit.dart';

class ChatPage extends StatelessWidget {
  final ChatUserModel chatUserModel;

  const ChatPage({
    super.key,
    required this.chatUserModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit()..getMessages(chatUserModel.id),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          final ChatCubit cubit = ChatCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Text(chatUserModel.name!),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: cubit.scrollController,
                    itemCount: cubit.reversedChatMessage.length,
                    itemBuilder: (context, index) {
                      final message = cubit.reversedChatMessage[index];
                      return ChatBubble(
                        text: message.text!,
                        isUser: message.senderId == Constants.doctorModel!.id ? true : false,
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
                            MessageModel message = MessageModel(
                              date: DateTime.now().toString(),
                              text: cubit.messageController.text,
                              sender: Constants.doctorModel!.name,
                              receiverId: chatUserModel.id,
                              senderId: Constants.doctorModel!.id,
                            );
                            cubit.sendMessage(message,chatUserModel.name!,chatUserModel.id!);
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
