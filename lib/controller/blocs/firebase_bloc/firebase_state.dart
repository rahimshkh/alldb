part of 'firebase_bloc.dart';

enum FirebaseStatus { loading, fetched, added, failed }

class FirebaseState extends Equatable {
  final FirebaseStatus status;
  final String alert;
  final List<UserModel> userList;

  const FirebaseState(
      {this.status = FirebaseStatus.loading,
      this.userList = const <UserModel>[],
      this.alert = ""});

  FirebaseState copyWith(
      {FirebaseStatus? status, String? alert, List<UserModel>? userList}) {
    return FirebaseState(
        status: status ?? this.status,
        alert: alert ?? this.alert,
        userList: userList ?? this.userList);
  }

  @override
  List<Object?> get props => [alert, userList, status];

  @override
  String toString() {
    return "user is $userList, alert is $alert, status is $status";
  }
}
