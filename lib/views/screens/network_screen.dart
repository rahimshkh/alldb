import '../../controller/blocs/network_bloc/network_bloc.dart';
import '../../helper/extensions/show_snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helper/constants/app_strings.dart';
import '../widgets/custom_bottom_bar.dart';
import '../widgets/invalid_state.dart';
import '../widgets/loading_state.dart';
import '../widgets/users_list.dart';

class NetworkScreen extends StatelessWidget {
  final int? currentIndex;

  const NetworkScreen({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.kApiLabel),
      ),
      body: BlocListener<NetworkBloc, NetworkState>(
        listener: (context, state) {
          if (state.status == NetworkStatus.failed) {
            state.alert.showSnackBar(context);
          } else {}
        },
        child: BlocBuilder<NetworkBloc, NetworkState>(
          builder: (context, state) {
            if (state.status == NetworkStatus.loading) {
              context.read<NetworkBloc>().add(FetchDataEvent());
              return const LoadingState();
            } else if (state.status == NetworkStatus.fetched) {
              return UsersList(userList: state.userList);
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
