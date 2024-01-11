import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/models/message_model.dart';
import 'package:intelligent_pharmacy/shared/utils/constants.dart';

part 'doctor_chat_state.dart';

class DoctorChatCubit extends Cubit<DoctorChatState> {
  DoctorChatCubit() : super(DoctorChatInitial());

  static DoctorChatCubit get(context) => BlocProvider.of(context);
  final TextEditingController messageController = TextEditingController();
  List<MessageModel> chatMessage = [];
  List<MessageModel> reversedChatMessage = [];
  ScrollController scrollController = ScrollController();

  void sendMessage(MessageModel message) {
    FirebaseFirestore.instance.collection('users').doc(message.senderId).collection('chat').add(message.toMap());
    FirebaseFirestore.instance.collection('doctors').doc(message.receiverId).collection('chat').add(message.toMap());
  }

  void getMessages() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(Constants.userModel!.id)
        .collection('chat')
        .orderBy('date')
        .snapshots()
        .listen((event) {
      for (var element in event.docs) {
        chatMessage.add(MessageModel.fromJson(element.data()));
      }
      reversedChatMessage = chatMessage.reversed.toList();
      emit(GetAllMessagesSuccessfully());
      scrollController.animateTo(
        double.minPositive,
        duration: const Duration(microseconds: 1),
        curve: Curves.bounceIn,
      );
    });
  }
}
