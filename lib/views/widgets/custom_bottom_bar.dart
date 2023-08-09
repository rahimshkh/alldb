import '../../controller/cubits/bottom_navigation_cubit.dart';
import '../../helper/constants/app_icons.dart';
import '../../helper/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => context.read<BottomNavigationCubit>().onTap(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(AppIcons.kFirebaseIcon),
            label: AppStrings.kFirebaseLabel,
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.kLocalDBIcon),
            label: AppStrings.kLocalDBLabel,
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.kApiIcon),
            label: AppStrings.kApiLabel,
          ),
        ]);
  }
}
