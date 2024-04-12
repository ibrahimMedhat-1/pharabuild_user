import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../models/user_model.dart';
import '../../../../../shared/network/cache_keys.dart';
import '../../../../../shared/network/cached_preference.dart';
import '../../../../../shared/utils/constants.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? imageUrl;

  void getUserData() {
    FirebaseFirestore.instance.collection('users').doc(Constants.userModel!.id).get().then((value) async {
      await cachingUser(value, CacheKeys.userId);
      Constants.userModel = UserModel.fromJson(jsonDecode(await CacheHelper.getData(key: CacheKeys.userId)));
      nameController.text = Constants.userModel!.name!;
      phoneController.text = Constants.userModel!.phoneNo!;
      emailController.text = Constants.userModel!.email!;
      imageUrl = Constants.userModel!.image!.split(':').last;
      emit(GetUserDataSuccessfully());
    });
  }

  void changeUserData() {
    emit(ChangeDataLoading());
    FirebaseFirestore.instance.collection('users').doc(Constants.userModel!.id).update({
      'name': nameController.text.trim(),
      'phoneNo': phoneController.text.trim(),
    }).then((value) {
      getUserData();
      emit(ChangeData());
    });
  }

  void updateProfilePicture() async {
    emit(ChangeProfileImageLoading());
    await ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      XFile image = XFile(value!.path);
      FirebaseStorage.instance
          .ref()
          .child('profileImages/${Constants.userModel!.id}')
          .putFile(File(image.path))
          .then((p0) {
        p0.ref.getDownloadURL().then((value) {
          imageUrl = value.split(':').last;
          FirebaseFirestore.instance.collection('users').doc(Constants.userModel!.id).update(
            {'image': value},
          ).then((value) {
            emit(ChangeProfileImageSuccessfully());
            getUserData();
          });
        });
      });
    });
  }

  Future<void> cachingUser(DocumentSnapshot<Map<String, dynamic>> value, String userType) async {
    List<String> map = [];
    dynamic array = value.data().toString().split('');
    await array.removeAt(0);
    await array.removeLast();
    array = await array.join('');
    array = await array.split(',');
    await CacheHelper.setData(key: userType, value: (handlingMapResponse(array, map).toString()));
  }

  String handlingMapResponse(List array, List<String> map) {
    for (int i = 0; i < array.length; i++) {
      dynamic key = array[i].toString().trim().split(" ")[0].split("");
      var value = array[i].toString().trim().split(" ").last == array[i].toString().trim().split(" ")[0]
          ? ''
          : array[i].toString().trim().split(":").last.trim();
      debugPrint(array[i].toString().trim().split(":").last.trim());
      key.removeLast();
      key = key.join();
      map.add('"$key" : "$value",');
    }
    String last = (map.last.split('')..removeLast()).join();
    map
      ..removeLast()
      ..insert(map.length, last);
    debugPrint(map.join());
    return '{${map.join().toString()}}';
  }
}
