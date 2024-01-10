import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/user/features/doctors_list/manager/doctor_chat_cubit/doctor_chat_cubit.dart';

import '../../../../shared/styles/colors.dart';
import '../../chatbot/view/widgets/chat_bubble.dart';

class DoctorChatPage extends StatelessWidget {
  final String doctorName;

  const DoctorChatPage({
    super.key,
    required this.doctorName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorChatCubit(),
      child: BlocConsumer<DoctorChatCubit, DoctorChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          final DoctorChatCubit cubit = DoctorChatCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(doctorName),
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
