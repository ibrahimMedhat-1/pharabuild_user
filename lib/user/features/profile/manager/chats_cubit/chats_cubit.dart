import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/shared/utils/constants.dart';

import '../../../../../models/doctor_model.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(ChatsInitial());

  static ChatsCubit get(context) => BlocProvider.of(context);

  List<DoctorModel> doctorsList = [];

  void getAllChats() {
    emit(GetAllChatsLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(Constants.userModel!.id)
        .collection('chat')
        .snapshots()
        .listen((value) async {
      doctorsList.clear();
      for (var element in value.docs) {
        await FirebaseFirestore.instance.collection('doctors').doc(element.id).get().then((value) {
          doctorsList.add(DoctorModel.fromJson(value.data(), lastMessage: element.data()['lastMessage']));
        });
      }
      emit(GetAllChatsSuccessfully());
    });
  }
}
