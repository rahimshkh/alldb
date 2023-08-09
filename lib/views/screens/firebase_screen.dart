import '../../controller/blocs/firebase_bloc/firebase_bloc.dart';
import '../../helper/extensions/show_snackbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_floating_button.dart';

import '../../helper/constants/app_strings.dart';
import '../widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/invalid_state.dart';
import '../widgets/loading_state.dart';
import '../widgets/users_list.dart';

class FirebaseScreen extends StatelessWidget {
  final int? currentIndex;

  const FirebaseScreen({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      floatingActionButton: CustomFloatingButton(
        width: width,
        height: height,
        dbLabel: AppStrings.kFirebaseLabel,
      ),
      appBar: AppBar(
        title: const Text(AppStrings.kFirebaseLabel),
      ),
      body: BlocListener<FirebaseBloc, FirebaseState>(
        listener: (context, state) {
          if (state.status == FirebaseStatus.failed) {
            state.alert.showSnackBar(context);
          } else if (state.status == FirebaseStatus.added) {
            state.alert.showSnackBar(context);
          } else {}
        },
        child: BlocBuilder<FirebaseBloc, FirebaseState>(
          builder: (context, state) {
            if (state.status == FirebaseStatus.loading) {
              context.read<FirebaseBloc>().add(FetchDataEvent());
              return const LoadingState();
            } else if (state.status == FirebaseStatus.fetched) {
              return UsersList(userList: state.userList);
            } else if (state.status == FirebaseStatus.added) {
              return const SizedBox();
            } else {
              return const InvalidState();
            }
          },
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: currentIndex!,
      ),
    );
  }
}
