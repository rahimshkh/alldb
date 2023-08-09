import 'package:alldb/helper/constants/app_strings.dart';
import 'package:alldb/helper/utils/hive_utils.dart';
import 'package:alldb/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'hive_events.dart';

part 'hive_states.dart';

class HiveBloc extends Bloc<HiveEvents, HiveState> {
  HiveBloc() : super(const HiveState()) {
    on<AddLocalDataEvent>(onAddDataEvent);
    on<FetchDataEvent>(onFetchDataEvent);
  }

  onFetchDataEvent(FetchDataEvent event, Emitter<HiveState> emit) {
    List<UserModel> userList = HiveStorageManager.getData();
    emit(state.copyWith(
      status: HiveStatus.fetched,
      userList: userList,
    ));
  }

  onAddDataEvent(AddLocalDataEvent event, Emitter<HiveState> emit) {
    emit(state.copyWith(status: HiveStatus.loading));
    UserModel user = UserModel(name: event.name, email: event.email, avatar: "");
    HiveStorageManager.addUser(user);
    emit(state.copyWith(status: HiveStatus.added, alert: AppStrings.kDataAdded));
    add(FetchDataEvent());
  }
}
