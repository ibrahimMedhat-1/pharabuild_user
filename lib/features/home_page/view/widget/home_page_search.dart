import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/styles/colors.dart';
import '../../manager/home_page_cubit.dart';

class HomePageSearchWidget extends StatelessWidget {
  const HomePageSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(14),
          child: Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(11),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Address, city, state...',
                labelStyle: Theme.of(context).textTheme.bodySmall,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: MaterialButton(
                  color: ColorsAsset.mainColor,
                  textColor: Colors.white,
                  onPressed: () {},
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  child: const Text('Search'),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
