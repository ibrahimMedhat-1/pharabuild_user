import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/doctor/features/home_page/manager/doctor_home_cubit.dart';
import 'package:intelligent_pharmacy/doctor/features/home_page/view/widgets/users_list_widget.dart';

class DoctorHomePage extends StatelessWidget {
  const DoctorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorHomeCubit()..getUsers(),
      child: BlocConsumer<DoctorHomeCubit, DoctorHomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final DoctorHomeCubit cubit = DoctorHomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("Chats"),
              centerTitle: true,
            ),
            body: SafeArea(
              child: CustomScrollView(
                slivers: [

                  UsersListWidget(
                    users: cubit.users,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
