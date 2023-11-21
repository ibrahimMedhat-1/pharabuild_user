import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../chatbot_model/chatbot_model.dart';

part 'chatbot_state.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  ChatbotCubit() : super(ChatbotInitial());
  static ChatbotCubit get(context) => BlocProvider.of(context);
  List<ChatMessage> chatMessage = [];
  final TextEditingController messageController = TextEditingController();
  String myApiKey = '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';

  void sendMessage(String message) async {
    final response = await http.post(
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
        }));
    if (response.statusCode == 200) {
      final jsonResponse = await jsonDecode(response.body);
      debugPrint(jsonResponse.toString());

      chatMessage.add(ChatMessage(text: message, isUser: true));
      chatMessage.add(ChatMessage(text: jsonResponse['choices'][0]['message']['content'], isUser: false));
      emit(SendMEssage());
    } else {
      debugPrint("Request failed with status ${response.body}");
    }
  }
}
