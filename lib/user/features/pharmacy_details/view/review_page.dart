import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intelligent_pharmacy/models/pharmacy_model.dart';
import 'package:intelligent_pharmacy/models/review_model.dart';
import 'package:intelligent_pharmacy/shared/toast.dart';

import '../../../../shared/utils/constants.dart';

class AddReviewPage extends StatefulWidget {
  final PharmacyModel pharmacyModel;

  const AddReviewPage({required this.pharmacyModel, super.key});

  @override
  State<AddReviewPage> createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  bool isLoading = false;
  TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.pharmacyModel.name!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    maxLines: 10,
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Please Write Your Review...',
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 5,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    child: const Text('Submit Review'),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        FirebaseFirestore.instance
                            .collection('pharmacies')
                            .doc(widget.pharmacyModel.id!)
                            .collection('reviews')
                            .add({}).then((value) {
                          value.set(ReviewModel(
                            name: Constants.userModel!.name,
                            profileImage: Constants.userModel!.image,
                            description: controller.text,
                            reviewerId: Constants.userModel!.id,
                            id: value.id,
                          ).toMap());
                        }).then((value) {
                          setState(() {
                            isLoading = false;
                            controller.clear();
                          });
                        }).catchError((onError) {
                          setState(() {
                            isLoading = false;
                          });
                          showToast(onError.message);
                        });
                      }
                    },
                  )
          ],
        ),
      ),
    );
  }
}
