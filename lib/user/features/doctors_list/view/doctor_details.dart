import 'package:flutter/material.dart';
import 'package:intelligent_pharmacy/user/features/pharmacy_details/view/widgets/pharmacy_details_widget/bottom_more_products.dart';
import 'package:intelligent_pharmacy/user/features/pharmacy_details/view/widgets/pharmacy_details_widget/top_image.dart';
import 'package:url_launcher/url_launcher.dart';

import 'doctor_chat_page.dart';

class DoctorDetails extends StatelessWidget {
  final String image;
  final String tag;
  final String doctorName;
  final String doctorNo;
  final String address;
  final String speciality;

  const DoctorDetails({
    super.key,
    required this.image,
    required this.tag,
    required this.doctorName,
    required this.doctorNo,
    required this.address,
    required this.speciality,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(child: TopImageWidget(tag: tag, image: image)),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  InkWell(
                    onTap: () async {
                      await launchUrl(Uri.parse('tel://$doctorNo'));
                    },
                    child: Text(
                      doctorNo,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Text(
                    'Address',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(),
                  ),
                  InkWell(
                    onTap: () async {
                      await launchUrl(Uri.parse('tel://$doctorNo'));
                    },
                    child: Text(
                      address,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Text(
                    'Speciality',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(),
                  ),
                  Text(
                    speciality,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Bio',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          height: 2,
                        ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width - 40,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white, boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 0),
                        blurRadius: 3,
                      ),
                    ]),
                    child: const Text('Ain shams university'),
                  ),
                  const Spacer(),
                  BottomWidget(
                    text: 'Let\'s Chat',
                    buttonText: 'Chat Now',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => DoctorChatPage(
                                  doctorName: doctorName,
                                )),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
