import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/user/features/doctors_list/view/doctor_details.dart';

import '../../../../../models/doctor_model.dart';
import '../../manager/doctor_list_cubit/doctor_list_cubit.dart';

class DoctorListWidget extends StatelessWidget {

  const DoctorListWidget({ super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => DoctorListCubit()..getAllDoctors(),
      child: BlocConsumer<DoctorListCubit, DoctorListState>(
        listener: (context, state) {},
  builder: (context, state) {
    final DoctorListCubit cubit = DoctorListCubit.get(context);
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) => DoctorDetails(
                  doctorModel: cubit.doctorsList[index],
                ),
              ),
            );
          },
          child: Hero(
            tag: cubit.doctorsList[index].id!,
            child: AspectRatio(
              aspectRatio: 2.5/ 1.1,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cubit.doctorsList[index].name!,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(height: 2),
                          ),
                          Text(
                            cubit.doctorsList[index].phoneNo!,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 2),
                          ),

                          Text(
                            cubit.doctorsList[index].speciality!,
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(height: 3),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        itemCount: cubit.doctorsList.length,
      ),
    );
  },
),
);
  }
}
