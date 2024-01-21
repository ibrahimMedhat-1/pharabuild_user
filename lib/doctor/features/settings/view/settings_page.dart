import 'package:flutter/material.dart';
import 'package:intelligent_pharmacy/shared/utils/constants.dart';

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
              TextFormField(),
              TextFormField(),
              TextFormField(),
              DropdownButton(items: [], onChanged: (value) {}),
              TextFormField(),
              MaterialButton(color: Colors.blue, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
