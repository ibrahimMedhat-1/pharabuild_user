
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/doctor/features/settings/manager/doctor_edit_profile_cubit.dart';

import '../../../../shared/styles/colors.dart';
import '../../../../shared/utils/constants.dart';

class DoctorEditProfile extends StatelessWidget {
  const DoctorEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorEditProfileCubit()..initialize()..fetchPortfolioData(),
      child: BlocConsumer<DoctorEditProfileCubit, DoctorEditProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          final DoctorEditProfileCubit cubit = DoctorEditProfileCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("My Profile"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Text("Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    const SizedBox(height: 5),

                    TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal:10,vertical: 5 ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide()
                        )
                      ),
                      controller: cubit.nameController,
                    ),
                    const SizedBox(height: 10),
                    const Text("Phone Number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    const SizedBox(height: 5),
                    TextFormField(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal:10,vertical: 5 ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide()
                          )
                      ),
                      controller: cubit.phoneController,
                    ),
                    const SizedBox(height: 10),
                    const Text("Speciality",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    const SizedBox(height: 5),

                    TextFormField(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal:10,vertical: 5 ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide()
                          )
                      ),
                      controller: cubit.specialityController,
                    ),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("My Portfolio",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(ColorsAsset.mainColor),
                                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 30))),
                            onPressed: (){
                          cubit.uploadListImagesPost(description: cubit.joDescribtionController.text,images:cubit.listImagesUrl );

                        }, child: const Text("Upload images",style: TextStyle(color: Colors.white),)),

                      ],
                    ),


                    const SizedBox(height: 20),

                    state is UploadPortfolioImagesLoading?
                   const Center(
                      child: CircularProgressIndicator(),
                    ):

                    SizedBox(
                      width: 400,
                      height: MediaQuery.of(context).size.height*0.6,
                      child: Column(
                        children: [
                          Expanded(
                              child: PageView.builder(
                                itemCount: Constants.doctorModel!.images!.length,
                                itemBuilder: (context, index) {
                                  String imageUrl = Constants.doctorModel!.images![index];
                                  return Center(
                                    child: Image.network(
                                      imageUrl,
                                      fit: BoxFit.contain,
                                    ),
                                  );
                                },
                              )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    state is SaveLoading?
                    const Center(
                      child: CircularProgressIndicator(),
                    ):
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(ColorsAsset.mainColor),
                            padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 60))),
                        onPressed: (){
                          cubit.saveData(context);
                        },
                      child: const Text("Save",style: TextStyle(color: Colors.white),),
                      )

                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  Widget buildPortfolioView(DoctorEditProfileCubit cubit,BuildContext context) {
    if (Constants.doctorModel!.images!=null) {
      return  SizedBox(
        width: 400,
        height: MediaQuery.of(context).size.height*0.6,
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
                  itemCount: Constants.doctorModel!.images!.length,
                  itemBuilder: (context, index) {
                    String imageUrl = Constants.doctorModel!.images![index];
                    return Center(
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                )
            ),
          ],
        ),
      );
    } else {
      return ElevatedButton(onPressed: (){
        cubit.uploadListImagesPost(description: cubit.joDescribtionController.text,images:cubit.listImagesUrl );

      }, child: const Text("Upload images"));
    }
  }

}
