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
                BottomNavigationBarItem(
                  label: 'Products',
                  icon: Icon(Icons.featured_play_list_outlined),
                ),

                BottomNavigationBarItem(
                  label: 'Cart',
                  icon: Icon(Icons.shopping_cart_outlined),
                ),

                BottomNavigationBarItem(
                  label: 'Contractors',
                  icon: Icon(Icons.build),
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
