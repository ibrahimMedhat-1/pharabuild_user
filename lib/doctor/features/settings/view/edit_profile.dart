
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/doctor/features/settings/manager/doctor_edit_profile_cubit.dart';

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
                    const Text("My Portfolio",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),


                    const SizedBox(height: 20),
                    buildPortfolioView(cubit,context),
                    const SizedBox(height: 60,),
                    Align(
                      alignment: Alignment.center,
                      child: MaterialButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: const Text('Save'),
                        onPressed: () {
                          cubit.saveData(context);
                        },
                      ),
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
    if (cubit.portfolioDataList.isNotEmpty) {
      return SizedBox(
        width: 400,
        height: MediaQuery.of(context).size.height*0.6,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: cubit.portfolioDataList.length,
                itemBuilder: (context, index) {
                  List<String> images = cubit.portfolioDataList[index]['images'];
                  String description = cubit.portfolioDataList[index]['description'];

                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.45,
                          child: PageView.builder(
                            itemCount: images.length,
                            itemBuilder: (context, imageIndex) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(images[imageIndex]),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("Jop Description",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        const SizedBox(height: 5),
                        Text(description),
                      ],
                    ),
                  );
                },
              ),
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
