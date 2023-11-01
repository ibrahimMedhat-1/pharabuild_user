import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;
  const ProfileButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: ListTile(
        title: Text(title),
        trailing: Icon(icon),
      ),
    );
  }
}
