import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/user/features/doctors_list/view/doctor_details.dart';

import '../../manager/doctor_list_cubit/doctor_list_cubit.dart';

class DoctorListWidget extends StatelessWidget {
  const DoctorListWidget({super.key});

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
                    aspectRatio: 2.4 / 2,
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
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: cubit.doctorsList[index].images![0] ==null?
                            Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: const BoxDecoration(
                                color: Colors.grey
                                  ),
                              child: const Center(
                                child: Text("No Portfolio"),
                              ),
                            )
                                :

                            Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(
                                    cubit.doctorsList[index].images![0]),
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/icons8-contractor-100.png",
                                  height: 40,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Name : ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(height: 2),
                                ),
                                Text(
                                  cubit.doctorsList[index].name!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(height: 2),
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
