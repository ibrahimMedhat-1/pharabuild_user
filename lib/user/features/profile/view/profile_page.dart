import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intelligent_pharmacy/authentication/view/login_page.dart';
import 'package:intelligent_pharmacy/shared/network/cache_keys.dart';
import 'package:intelligent_pharmacy/shared/network/cached_preference.dart';
import 'package:intelligent_pharmacy/shared/utils/constants.dart';
import 'package:intelligent_pharmacy/user/features/profile/view/chats_page.dart';
import 'package:intelligent_pharmacy/user/features/profile/view/edit_profile_page.dart';

import '../manager/profile_cubit/profile_cubit.dart';
import 'widgets/profile_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context){
    ProfileCubit.get(context).getUserData();

    return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      Constants.userModel?.name?? "",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: 4),
                    ),
                    ProfileButton(
                      title: 'Edit Profile',
                      icon: Icons.arrow_forward_ios_outlined,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => const EditProfilePage(),
                            )).then((value) {});
                      },
                    ),
                    ProfileButton(
                      title: 'Chats',
                      icon: Icons.arrow_forward_ios_outlined,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => const AllChatsPage(),
                            ));
                      },
                    ),
                    ProfileButton(
                      title: 'Sign Out',
                      icon: Icons.arrow_forward_ios_outlined,
                      onTap: () async {
                        await CacheHelper.removeData(key: CacheKeys.userId).then((value) async {
                          await FirebaseAuth.instance.signOut().then((value) {
                            Constants.userModel=null;
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (builder) => const LoginPage(),
                                ),
                                (route) => false);
                          });
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

  }
}
