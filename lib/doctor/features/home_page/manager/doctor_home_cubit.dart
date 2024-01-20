import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/models/chat_user_model.dart';
import 'package:intelligent_pharmacy/models/message_model.dart';
import 'package:intelligent_pharmacy/shared/utils/constants.dart';

part 'doctor_home_state.dart';

class DoctorHomeCubit extends Cubit<DoctorHomeState> {
  DoctorHomeCubit() : super(DoctorHomeInitial());

  static DoctorHomeCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();
  List<ChatUserModel> users = [];
  List<ChatUserModel> searchList = [];

  void getUsers() {
    FirebaseFirestore.instance
        .collection('doctors')
        .doc(Constants.doctorModel!.id)
        .collection('chat')
        .snapshots()
        .listen((value) async {
      users.clear();
      for (var element in value.docs) {
        List<MessageModel> messages = [];
        await element.reference.collection('messages').get().then((value) {
          for (var element in value.docs) {
            messages.add(MessageModel.fromJson(element.data()));
          }
        });
        users.add(ChatUserModel.fromJson(element.data(), messages));
      }
      emit(GetAllUsersSuccessfully());
    });
  }

  void searchUsers(String value) {
    searchList = [];
    for (ChatUserModel user in users) {
      if (user.name!.toLowerCase().contains(value.toLowerCase())) {
        searchList.add(user);
      }
    }
    emit(IsSearchingForUser());
  }

  void isSearching(bool isSearching) {
    if (isSearching) {
      emit(IsSearchingForUser());
    } else {
      searchList = [];
      emit(IsNotSearchingForUser());
    }
  }
}
