import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:intelligent_pharmacy/doctor/features/settings/view/edit_profile.dart';
import 'package:intelligent_pharmacy/user/features/profile/view/widgets/profile_button.dart';

import '../../../../authentication/view/login_page.dart';
import '../../../../shared/network/cache_keys.dart';
import '../../../../shared/network/cached_preference.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/utils/custom_transitions/custom_transitions.dart';

class DoctorSettingsPage extends StatelessWidget {
  const DoctorSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage('https:${Constants.doctorModel!.image ?? ''}'),
              ),
              const Spacer(),
              ProfileButton(
                  title: 'Edit Profile',
                  icon: Icons.edit,
                  onTap: () {
                    Navigator.push(context, NavigateSlideTransition(child: const DoctorEditProfile()));
                  }),
              const SizedBox(height: 20),
              ProfileButton(
                  title: 'LogOut',
                  icon: Icons.arrow_forward_ios_outlined,
                  onTap: () async {
                    await CacheHelper.removeData(key: CacheKeys.doctorId).then((value) async {
                      await FirebaseAuth.instance.signOut().then((value) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => const LoginPage(),
                            ),
                            (route) => false).then((value) {
                          Phoenix.rebirth(context);
                        });
                      });
                    });
                  }),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
