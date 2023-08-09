part of 'network_bloc.dart';

abstract class NetworkEvents {}

class FetchDataEvent extends NetworkEvents {}

class AddCloudDataEvent extends NetworkEvents {
  final String name;
  final String email;

  AddCloudDataEvent({required this.name, required this.email});
}
