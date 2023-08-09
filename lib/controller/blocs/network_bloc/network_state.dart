part of 'network_bloc.dart';

enum NetworkStatus { loading, fetched, failed }

class NetworkState extends Equatable {
  final NetworkStatus status;
  final String alert;
  final List<UserModel> userList;

  const NetworkState(
      {this.status = NetworkStatus.loading,
        this.userList = const <UserModel>[],
        this.alert = ""});

  NetworkState copyWith(
      {NetworkStatus? status, String? alert, List<UserModel>? userList}) {
    return NetworkState(
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
