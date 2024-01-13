import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/utils/constants.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  String? imageUrl;
  String? name;
  void getUserData() async {
    await FirebaseFirestore.instance.collection('users').doc(Constants.userModel!.id).get().then((value) async {
      name = value.data()!['name'];
      imageUrl = value.data()!['image'].toString().split(':').last;
      emit(GetUserDataSuccessfully());
    });
  }
}
