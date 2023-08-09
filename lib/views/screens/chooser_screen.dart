import '../../controller/cubits/bottom_navigation_cubit.dart';
import 'network_screen.dart';
import 'firebase_screen.dart';
import 'local_db_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooserScreen extends StatelessWidget {
  const ChooserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, int>(builder: (context, state) {
      if (state == 0) {
        return FirebaseScreen(currentIndex: state);
      } else if (state == 1) {
        return LocalDbScreen(currentIndex: state);
      } else if (state == 2) {
        return NetworkScreen(currentIndex: state);
      } else {
        return const SizedBox();
      }
    });
  }
}
