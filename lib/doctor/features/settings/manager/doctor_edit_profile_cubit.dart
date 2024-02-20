import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intelligent_pharmacy/shared/utils/constants.dart';
import 'package:intelligent_pharmacy/shared/utils/image_helper/image_helper.dart';

import '../../../../models/doctor_model.dart';
import '../../../../shared/network/cache_keys.dart';
import '../../../../shared/network/cached_preference.dart';

part 'doctor_edit_profile_state.dart';

class DoctorEditProfileCubit extends Cubit<DoctorEditProfileState> {
  DoctorEditProfileCubit() : super(DoctorEditProfileInitial());

  static DoctorEditProfileCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController specialityController=TextEditingController();

  void initialize() {
    nameController.text = Constants.doctorModel!.name!;
    phoneController.text = Constants.doctorModel!.phoneNo!;
    specialityController.text = Constants.doctorModel!.speciality!;
  }

  File? imageFile;

  void changeImage(context) async {
    final files = await ImageHelper().pickImage();
    if (files.isNotEmpty) {
      final croppedImage = await ImageHelper().crop(file: files.first!, cropStyle: CropStyle.circle);
      if (croppedImage != null) {
        imageFile = File(croppedImage.path);
      } else {
        imageFile = File(files.first!.path);
      }
    }
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Change profile picture ?'),
              content: FittedBox(
                child: CircleAvatar(
                  radius: 80,
                  foregroundImage: FileImage(imageFile!),
                ),
              ),
              actionsAlignment: MainAxisAlignment.spaceAround,
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                MaterialButton(
                  onPressed: () {
                    emit(ChangeProfilePicture());
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            ));
  }



  void saveData(context) {
    var doctorDoc = FirebaseFirestore.instance.collection('doctors').doc(Constants.doctorModel!.id);
    doctorDoc.update({
      'name': nameController.text,
      'phoneNo': phoneController.text,
      'speciality': specialityController.text,
    }).then((value) {
      doctorDoc.get().then((value) async {
        await cachingUser(value, CacheKeys.doctorId);
        Constants.doctorModel = DoctorModel.fromCache(jsonDecode(await CacheHelper.getData(key: CacheKeys.doctorId)));
        initialize();
        Phoenix.rebirth(context);
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


  List<String> listImagesUrl = [];

  static Future<String> uploadImage(File file, String name) async {
    Reference reference =
    FirebaseStorage.instance.ref('Portfolio/$name');
    UploadTask uploadTask = reference.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  TextEditingController joDescribtionController = TextEditingController();

  Future<void> uploadListImagesPost({
    required List<String> images,
    required String description,
  }) async {
    final ImagePicker picker = ImagePicker();
    List<String> listImagesUrl = [];

    await picker.pickMultiImage(imageQuality: 50, maxWidth: 800).then(
          (listImages) async {
        if (listImages.isEmpty) {
        } else {
          for (var oneFile in listImages) {
            String imageName = oneFile.path.split('/').last;
            File file = File(oneFile.path);
            String imageUrl = await uploadImage(file, imageName);
            listImagesUrl.add(imageUrl);
          }

          var portfolioData = {
            'images': listImagesUrl,
            'description': description,



          };

          await FirebaseFirestore.instance
              .collection("doctors")
              .doc(Constants.doctorModel!.id)
              .update(portfolioData);

          emit(UploadPortfolioImages());
        }
      },
    );
  }
  List<Map<String, dynamic>> portfolioDataList = [];
  Future<void> fetchPortfolioData() async {

      await FirebaseFirestore.instance
          .collection("doctors")
          .doc(Constants.doctorModel!.id)
          .get().then((value) {
        Constants.doctorModel = DoctorModel.fromJson(value.data());
      });



emit(GetPortfolioImages())  ;  }
  }


