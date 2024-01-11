import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/shared/utils/constants.dart';
import 'package:intelligent_pharmacy/user/features/doctors_list/manager/doctor_chat_cubit/doctor_chat_cubit.dart';

import '../../../../models/doctor_model.dart';
import '../../../../models/message_model.dart';
import '../../../../shared/styles/colors.dart';
import '../../chatbot/view/widgets/chat_bubble.dart';

class DoctorChatPage extends StatelessWidget {
  final DoctorModel doctorModel;

  const DoctorChatPage({
    super.key,
    required this.doctorModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorChatCubit()..getMessages(),
      child: BlocConsumer<DoctorChatCubit, DoctorChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          final DoctorChatCubit cubit = DoctorChatCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(doctorModel.name!),
              centerTitle: true,
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
                        isUser: message.senderId == Constants.userModel!.id ? true : false,
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
                              sender: Constants.userModel!.name,
                              receiverId: doctorModel.id,
                              senderId: Constants.userModel!.id,
                            );
                            cubit.sendMessage(message);
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
