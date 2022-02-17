import 'package:flutter/material.dart';

import '../../../shared/config/colors.dart';
import '../../../shared/cubit/bloc/home_screen_bloc.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({
    Key? key,
    required this.homeScreenCubit,
  }) : super(key: key);

  final HomeScreenBloc homeScreenCubit;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: homeScreenCubit.categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Center(
          child: InkWell(
            onTap: () {
              homeScreenCubit.changeSelection(
                index: index,
              );
            },
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsetsDirectional.all(25),
              decoration: BoxDecoration(
                color: homeScreenCubit.areSelected[index] == true
                    ? const Color(kDefaultColor)
                    : const Color(kCustomAppBarColor),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(homeScreenCubit.categories[index]),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 10),
    );
  }
}
