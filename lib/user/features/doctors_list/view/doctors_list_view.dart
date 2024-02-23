import 'package:flutter/material.dart';
import 'package:intelligent_pharmacy/user/features/doctors_list/view/widgets/doctor_widget.dart';


class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {


        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Contractors',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 30,
                  ),
            ),
          ),
          body: const Column(
            children: [
             DoctorListWidget(),
            ],
          ),
        );

  }
}
