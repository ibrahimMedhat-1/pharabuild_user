import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intelligent_pharmacy/models/user_model.dart';

import '../../../../shared/network/cache_keys.dart';
import '../../../../shared/network/cached_preference.dart';
import '../../../../shared/utils/constants.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  static EditProfileCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? imageUrl = Constants.userModel!.image;

  void getUserData() {
    print(Constants.userModel!.image);
    nameController.text = Constants.userModel!.name!;
    phoneController.text = Constants.userModel!.phoneNo!;
    emailController.text = Constants.userModel!.email!;
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
            {'profilePicture': value},
          ).then((value) {
            FirebaseFirestore.instance.collection('users').doc(Constants.userModel!.id).get().then((value) async {
              await cachingUser(value, CacheKeys.userId);
              Constants.userModel = UserModel.fromJson(jsonDecode(await CacheHelper.getData(key: CacheKeys.userId)));
              print(Constants.userModel);
              emit(ChangeProfileImageSuccessfully());
            });
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
