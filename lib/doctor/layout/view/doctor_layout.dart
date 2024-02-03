import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/doctor/layout/manager/doctor_layout_cubit.dart';

class DoctorLayout extends StatelessWidget {
  const DoctorLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorLayoutCubit(),
      child: BlocConsumer<DoctorLayoutCubit, DoctorLayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          final DoctorLayoutCubit cubit = DoctorLayoutCubit.get(context);
          return Scaffold(
            body: cubit.pages[cubit.page],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.page,
              onTap: (page) {
                cubit.changePage(page);
              },
              items: const [
                BottomNavigationBarItem(
                  label: "Chats",
                  icon: Icon(Icons.chat_bubble_outline),
                ),
                BottomNavigationBarItem(
                  label: "Add Product",
                  icon: Icon(Icons.add),
                ),
                BottomNavigationBarItem(
                  label: "Settings",
                  icon: Icon(Icons.settings_outlined),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
