import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/styles/colors.dart';
import 'manager/layout_cubit.dart';

class UserLayout extends StatelessWidget {
  const UserLayout({super.key});

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
                // BottomNavigationBarItem(
                //   label: 'Stores',
                //   icon: Icon(Icons.store),
                // ),
                BottomNavigationBarItem(
                  label: 'Shop',
                  icon: Icon(Icons.store),
                ),
                BottomNavigationBarItem(
                  label: 'Cart',
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
                BottomNavigationBarItem(
                  label: 'Chat',
                  icon: Icon(Icons.chat_bubble_outline),
                ),
                BottomNavigationBarItem(
                  label: 'Contractors',
                  icon: Icon(Icons.engineering_outlined),
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
