import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../doctor/widgets/pharmacy_details_widget/bottom_more_products.dart';
import '../../../../models/doctor_model.dart';
import 'doctor_chat_page.dart';

class DoctorDetails extends StatelessWidget {
  final DoctorModel doctorModel;

  const DoctorDetails({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contractor Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SafeArea(child: TopImageWidget(tag: doctorModel.id!, image: doctorModel.image!)),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorModel.name!,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    InkWell(
                      onTap: () async {
                        await launchUrl(
                            Uri.parse('tel://${doctorModel.phoneNo}'));
                      },
                      child: Text(
                        doctorModel.phoneNo!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Text(
                      'Speciality',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(),
                    ),
                    Text(
                      doctorModel.speciality!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      width: 400,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Column(
                        children: [
                          Expanded(
                              child: PageView.builder(
                            itemCount: doctorModel.images!.length,
                            itemBuilder: (context, index) {
                              String imageUrl = doctorModel.images![index];
                              return Center(
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.contain,
                                ),
                              );
                            },
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            BottomWidget(
              text: 'Let\'s Chat',
              buttonText: 'Chat Now',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => DoctorChatPage(
                            doctorModel: doctorModel,
                          )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
