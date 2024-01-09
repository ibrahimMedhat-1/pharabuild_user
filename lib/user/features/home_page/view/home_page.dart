import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/user/features/home_page/view/widget/home_page_search.dart';
import 'package:intelligent_pharmacy/user/features/home_page/view/widget/pharmacy_widget.dart';

import '../../../../authentication/view/widgets/welcome_widget.dart';
import '../manager/home_page_cubit.dart';

class PharmaciesPage extends StatelessWidget {
  const PharmaciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit()..getAllPharmacies(),
      child: BlocConsumer<HomePageCubit, HomePageState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomePageCubit cubit = HomePageCubit.get(context);
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.black87,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WelcomeWidget(
                        welcomeText: 'Welcome!',
                        textColor: Colors.white,
                        logoColor: Colors.white,
                      ),
                      Text(
                        'Find your Pharmacy',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.black87,
                expandedHeight: 100,
                collapsedHeight: 80,
                flexibleSpace: SearchWidget(
                  controller: cubit.searchPharmacyController,
                  search: () {
                    cubit.searchPharmacies(cubit.searchPharmacyController.text);
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
              SliverToBoxAdapter(
                  child: (state is GetPharmacyLoading || state is PharmacySearchLoading)
                      ? const Center(child: CircularProgressIndicator())
                      : state is IsSearchingInMedicineInCategory
                          ? PharmaciesList(cubit.searchPharmacyList)
                          : PharmaciesList(cubit.pharmacies)),
            ],
          );
        },
      ),
    );
  }
}
