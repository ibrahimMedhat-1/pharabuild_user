import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/authentication/view/widgets/custom_text_form.dart';
import 'package:intelligent_pharmacy/user/features/profile/manager/edit_profile_cubit/edit_profile_cubit.dart';

import '../../../../shared/utils/images.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit()..getUserData(),
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          final EditProfileCubit cubit = EditProfileCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.sizeOf(context).width * 0.2,
                            backgroundImage: cubit.imageUrl == null
                                ? const AssetImage(ImagesAsset.profileImage)
                                : NetworkImage('https:${cubit.imageUrl!}') as ImageProvider,
                          ),
                          MaterialButton(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: EdgeInsets.zero,
                            height: 0,
                            minWidth: 0,
                            onPressed: () {
                              cubit.updateProfilePicture();
                            },
                            color: Colors.blue,
                            textColor: Colors.white,
                            shape: const CircleBorder(side: BorderSide(color: Colors.blueAccent)),
                            child: const Icon(
                              Icons.edit,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
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
                      MaterialButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        elevation: 5,
                        onPressed: () {
                          cubit.changeUserData();
                        },
                        child: const Text('Save'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
