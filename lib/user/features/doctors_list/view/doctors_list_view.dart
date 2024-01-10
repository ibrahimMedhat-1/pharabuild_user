import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/user/features/doctors_list/manager/doctor_list_cubit/doctor_list_cubit.dart';
import 'package:intelligent_pharmacy/user/features/doctors_list/view/widgets/doctor_widget.dart';

import '../../medicine/view/medicine_page.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorListCubit()..getAllDoctors(),
      child: BlocConsumer<DoctorListCubit, DoctorListState>(
        listener: (context, state) {},
        builder: (context, state) {
          final DoctorListCubit cubit = DoctorListCubit.get(context);
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Category',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      DropdownButton(
                        isExpanded: true,
                        hint: const Text('Specialities'),
                        value: cubit.dropDownMenuItemValue,
                        items: [
                          dropDownItem(context, 'Bones'),
                          dropDownItem(context, 'General'),
                          dropDownItem(context, 'Dentist'),
                        ],
                        onChanged: (value) {
                          cubit.changeDropDownItem(value);
                        },
                      ),
                    ],
                  ),
                ),
                state is GetAllDoctorsLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : DoctorListWidget(doctors: cubit.doctorsList),
              ],
            ),
          );
        },
      ),
    );
  }
}
