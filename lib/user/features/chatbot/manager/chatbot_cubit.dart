import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:http/http.dart" as http;
import 'package:intelligent_pharmacy/shared/toast.dart';

import '../../../../models/chatbot_model.dart';

part 'chatbot_state.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  ChatbotCubit() : super(ChatbotInitial());

  static ChatbotCubit get(context) => BlocProvider.of(context);
  List<ChatMessage> chatMessage = [];
  List<ChatMessage> reversedChatMessage = [];
  final TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  bool isTyping = false;
  String myApiKey = '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';

  void sendMessage(String message) async {
    chatMessage.add(ChatMessage(text: message, isUser: true));
    reversedChatMessage = chatMessage.reversed.toList();
    isTyping = true;
    emit(SendChatBotMessageLoading());
    await http
        .post(
      Uri.parse(
        "https://api.openai.com/v1/chat/completions",
      ),
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $myApiKey",
      },
      body: json.encode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "system", "content": "You are a helpful assistant."},
          {"role": "user", "content": message}
        ],
        'max_tokens': 200,
      }),
    )
        .then((value) async {
      if (value.statusCode == 200) {
        final jsonResponse = await jsonDecode(value.body);
        debugPrint(jsonResponse.toString());

        chatMessage.add(ChatMessage(text: jsonResponse['choices'][0]['message']['content'], isUser: false));
        emit(SendMessage());
        scrollController.animateTo(
          scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 1),
          curve: Curves.bounceIn,
        );
      } else {
        debugPrint("Request failed with status ${value.body}");
      }
      isTyping = false;
      emit(SendChatBotMessageSuccessfully());
    }).catchError((onError) {
      emit(SendChatBotMessageError());
      showToast(onError.message);
    });
    reversedChatMessage = chatMessage.reversed.toList();
  }
}
