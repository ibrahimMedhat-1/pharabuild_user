import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/shared/utils/icons.dart';

import '../../shared/styles/colors.dart';
import 'manager/layout_cubit.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          LayoutCubit cubit = LayoutCubit.get(context);
          return Scaffold(
            appBar: AppBar(toolbarHeight: 0),
            body: cubit.pages[cubit.page],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.page,
              selectedItemColor: ColorsAsset.mainColor,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                cubit.changePage(index);
              },
              items: const [
                BottomNavigationBarItem(
                  label: 'Pharmacy',
                  icon: Icon(Icons.local_pharmacy_outlined),
                ),
                BottomNavigationBarItem(
                  label: 'Medicine',
                  icon: Icon(Icons.medical_information_outlined),
                ),
                BottomNavigationBarItem(
                  label: 'Cart',
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
                BottomNavigationBarItem(
                  label: 'ChatBot',
                  icon: Icon(Icons.chat_bubble_outline),
                ),
                BottomNavigationBarItem(
                  label: 'Doctors',
                  icon: ImageIcon(AssetImage(IconsAsset.doctorsIcon)),
                ),
                BottomNavigationBarItem(
                  label: 'Profile',
                  icon: Icon(Icons.person),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
