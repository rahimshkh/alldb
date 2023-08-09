part of 'hive_bloc.dart';

abstract class HiveEvents {}

class FetchDataEvent extends HiveEvents {}

class AddLocalDataEvent extends HiveEvents {
  final String name;
  final String email;

  AddLocalDataEvent({required this.name, required this.email});
}
