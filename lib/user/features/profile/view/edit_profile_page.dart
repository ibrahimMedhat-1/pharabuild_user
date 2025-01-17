import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/authentication/view/widgets/custom_text_form.dart';
import 'package:intelligent_pharmacy/shared/styles/colors.dart';
import 'package:intelligent_pharmacy/user/features/profile/manager/profile_cubit/profile_cubit.dart';


class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit.get(context).getUserData();
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        final ProfileCubit cubit = ProfileCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    CustomTextForm(
                      controller: cubit.nameController,
                      obscure: false,
                      labelText: 'Name',
                      hintText: 'Name',
                      keyboardType: TextInputType.name,
                      validationText: '',
                    ),
                    CustomTextForm(
                      controller: cubit.phoneController,
                      obscure: false,
                      labelText: 'Phone',
                      hintText: 'Phone',
                      keyboardType: TextInputType.name,
                      validationText: '',
                    ),
                    CustomTextForm(
                      controller: cubit.emailController,
                      obscure: false,
                      labelText: 'Email',
                      hintText: 'Email',
                      keyboardType: TextInputType.name,
                      validationText: '',
                      isEnabled: false,
                    ),
                    const SizedBox(height: 10,),
                    state is ChangeDataLoading?
                    const Center(
                      child: CircularProgressIndicator(),
                    ):
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(ColorsAsset.mainColor),
                          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 60))),
                      onPressed: (){
                        cubit.changeUserData();
                      },
                      child: const Text("Save",style: TextStyle(color: Colors.white),),
                    )

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
