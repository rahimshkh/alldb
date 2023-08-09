import 'package:alldb/helper/constants/app_keys.dart';
import 'package:alldb/helper/utils/network_utils.dart';
import 'package:alldb/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'network_events.dart';

part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvents, NetworkState> {
  NetworkBloc() : super(const NetworkState()) {
    on<FetchDataEvent>(onFetchDataEvent);
  }

  onFetchDataEvent(FetchDataEvent event, Emitter<NetworkState> emit) async {
    List<UserModel> userList = [];
    Response response = await NetworkUtils.getUsers();
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      List<dynamic> userData = data[AppKeys.kUserData];
      for (Map<String, dynamic> users in userData) {
        UserModel user = UserModel.fromJson(users);
        userList.add(user);
      }
      emit(state.copyWith(status: NetworkStatus.fetched, userList: userList));
    } else {
      emit(state.copyWith(status: NetworkStatus.failed, alert: response.statusMessage));
    }
  }
}
