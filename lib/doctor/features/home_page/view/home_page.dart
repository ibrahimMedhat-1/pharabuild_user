import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/doctor/features/home_page/manager/doctor_home_cubit.dart';
import 'package:intelligent_pharmacy/doctor/features/home_page/view/widgets/users_list_widget.dart';
import 'package:intelligent_pharmacy/user/features/home_page/view/widget/home_page_search.dart';

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
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.black87,
                    expandedHeight: 100,
                    collapsedHeight: 80,
                    flexibleSpace: SearchWidget(
                      controller: cubit.searchController,
                      search: () {
                        cubit.searchUsers(cubit.searchController.text);
                      },
                      onChange: (value) {
                        if (value.isEmpty) {
                          cubit.isSearching(false);
                        } else {
                          cubit.isSearching(true);
                        }
                      },
                    ),
                  ),
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
