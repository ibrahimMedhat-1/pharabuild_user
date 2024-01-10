import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/chatbot_model.dart';

part 'doctor_chat_state.dart';

class DoctorChatCubit extends Cubit<DoctorChatState> {
  DoctorChatCubit() : super(DoctorChatInitial());
  static DoctorChatCubit get(context) => BlocProvider.of(context);
  List<ChatMessage> chatMessage = [];
  final TextEditingController messageController = TextEditingController();
  void sendMessage(String message) {}
}
