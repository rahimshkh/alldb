import '../../controller/blocs/hive_bloc/hive_bloc.dart';
import '../../helper/extensions/show_snackbar.dart';
import '../widgets/custom_floating_button.dart';
import '../widgets/invalid_state.dart';
import '../widgets/loading_state.dart';
import '../widgets/users_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helper/constants/app_strings.dart';
import '../widgets/custom_bottom_bar.dart';

class LocalDbScreen extends StatelessWidget {
  final int? currentIndex;

  const LocalDbScreen({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      floatingActionButton: CustomFloatingButton(
        height: height,
        width: width,
        dbLabel: AppStrings.kLocalDBLabel,
      ),
      appBar: AppBar(
        title: const Text(AppStrings.kLocalDBLabel),
      ),
      body: BlocListener<HiveBloc, HiveState>(
        listener: (context, state) {
          if (state.status == HiveStatus.failed) {
            state.alert.showSnackBar(context);
          } else if (state.status == HiveStatus.added) {
            state.alert.showSnackBar(context);
          } else {}
        },
        child: BlocBuilder<HiveBloc, HiveState>(
          builder: (context, state) {
            if (state.status == HiveStatus.loading) {
              context.read<HiveBloc>().add(FetchDataEvent());
              return const LoadingState();
            } else if (state.status == HiveStatus.fetched) {
              return UsersList(userList: state.userList);
            } else if (state.status == HiveStatus.added) {
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
