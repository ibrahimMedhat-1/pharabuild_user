import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/authentication/view/widgets/custom_text_form.dart';
import 'package:intelligent_pharmacy/user/features/profile/manager/edit_profile_cubit.dart';

import '../../../../shared/utils/constants.dart';
import '../../../../shared/utils/images.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(),
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          final EditProfileCubit cubit = EditProfileCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: MediaQuery.sizeOf(context).width * 0.2,
                          backgroundImage: Constants.userModel!.image == null
                              ? const AssetImage(ImagesAsset.profileImage)
                              : CachedNetworkImage(
                                  imageUrl: Constants.userModel!.image!,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  imageBuilder: (context, imageProvider) => Image(
                                      image: CachedNetworkImageProvider(
                                    Constants.userModel!.image!,
                                  )),
                                ) as ImageProvider,
                        ),
                        MaterialButton(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: EdgeInsets.zero,
                          height: 0,
                          minWidth: 0,
                          onPressed: () {},
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
}
