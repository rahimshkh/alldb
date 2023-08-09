import '../../../helper/constants/app_strings.dart';
import '../../../helper/utils/firestore_utils.dart';
import '../../../models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'firebase_events.dart';

part 'firebase_state.dart';

class FirebaseBloc extends Bloc<FirebaseEvents, FirebaseState> {
  FirebaseBloc() : super(const FirebaseState()) {
    on<AddCloudDataEvent>(onAddDataEvent);
    on<FetchDataEvent>(onFetchDataEvent);
  }

  onFetchDataEvent(FetchDataEvent event, Emitter<FirebaseState> emit) async {
    await FireStoreUtils.fetchData().then((users) {
      List<UserModel> userList = [];
      List<dynamic> userDocs = users.docs;
      if (userDocs.isNotEmpty) {
        for (var doc in userDocs) {
          Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
          userList.add(UserModel.fromJson(userData));
        }
      }
      emit(state.copyWith(status: FirebaseStatus.fetched, userList: userList));
    }).catchError((error) {
      emit(state.copyWith(status: FirebaseStatus.failed, alert: error.toString()));
    });
  }

  onAddDataEvent(AddCloudDataEvent event, Emitter<FirebaseState> emit) {
    emit(state.copyWith(status: FirebaseStatus.loading));
    UserModel user = UserModel(name: event.name, email: event.email, avatar: "");
    FireStoreUtils.saveData(user: user);
    emit(state.copyWith(status: FirebaseStatus.added, alert: AppStrings.kDataAdded));
    add(FetchDataEvent());
  }
}
