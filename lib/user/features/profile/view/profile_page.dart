import 'package:flutter/material.dart';
import 'package:intelligent_pharmacy/user/features/profile/view/chats_page.dart';
import 'package:intelligent_pharmacy/user/features/profile/view/edit_profile_page.dart';

import 'widgets/profile_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: MediaQuery.sizeOf(context).width * 0.2,
            backgroundImage: const AssetImage('assets/test/profile_image.jpeg'),
          ),
          Text(
            'Ibrahim Medhat',
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
                  ));
            },
          ),
          ProfileButton(
            title: 'Chats',
            icon: Icons.arrow_forward_ios_outlined,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => const ChatsPage(),
                  ));
            },
          ),
          ProfileButton(
            title: 'Sign Out',
            icon: Icons.arrow_forward_ios_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
