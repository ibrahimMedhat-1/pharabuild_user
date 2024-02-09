import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/user/features/doctors_list/manager/doctor_list_cubit/doctor_list_cubit.dart';
import 'package:intelligent_pharmacy/user/features/doctors_list/view/widgets/doctor_widget.dart';

import '../../medicine/view/medicine_page.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {


        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Doctors',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 30,
                  ),
            ),
          ),
          body: Column(
            children: [
             DoctorListWidget(),
            ],
          ),
        );

  }
}
