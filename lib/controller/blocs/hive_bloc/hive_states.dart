part of 'hive_bloc.dart';

enum HiveStatus { loading, fetched, added, failed }

class HiveState extends Equatable {
  final HiveStatus status;
  final String alert;
  final List<UserModel> userList;

  const HiveState(
      {this.status = HiveStatus.loading,
      this.userList = const <UserModel>[],
      this.alert = ""});

  HiveState copyWith({HiveStatus? status, String? alert, List<UserModel>? userList}) {
    return HiveState(
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
