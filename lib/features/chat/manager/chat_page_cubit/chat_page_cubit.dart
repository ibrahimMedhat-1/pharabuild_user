import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/models/message_model.dart';

part 'chat_page_state.dart';

class ChatPageCubit extends Cubit<ChatPageState> {
  ChatPageCubit() : super(ChatPageInitial());
  static ChatPageCubit get(context) => BlocProvider.of(context);
  List<MessageModel> messages = [
    MessageModel(
        date: '1:24 PM',
        text: 'Hi Therjkhdsfgsdhfkjkhfghfgkhsdkhvksnfjkdkhksdhvjksdgvnsdjkvksdnvkjsdvdjshvksdh,hsuhviruhsnfsvksdlihe',
        receiverId: '1',
        senderId: '2',
        sender: 'patient'),
    MessageModel(date: '1:24 PM', text: 'Hi There', receiverId: '2', senderId: '1', sender: 'doctor'),
  ];
}
