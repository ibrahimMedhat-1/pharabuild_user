import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intelligent_pharmacy/models/pharmacy_model.dart';
import 'package:intelligent_pharmacy/models/review_model.dart';

import '../../../../shared/utils/constants.dart';

class AddReviewPage extends StatelessWidget {
  final PharmacyModel pharmacyModel;

  const AddReviewPage({required this.pharmacyModel, super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(pharmacyModel.name!),
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
                child: TextFormField(
                  maxLines: 10,
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Please Write Your Review...',
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 5,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              child: const Text('Submit Review'),
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('pharmacies')
                    .doc(pharmacyModel.id!)
                    .collection('reviews')
                    .add({}).then((value) {
                  value.set(ReviewModel(
                    name: Constants.userModel.name,
                    profileImage: Constants.userModel.image,
                    description: controller.text,
                    reviewerId: Constants.userModel.id,
                    id: value.id,
                  ).toMap());
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
