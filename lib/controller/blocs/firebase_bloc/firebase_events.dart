part of 'firebase_bloc.dart';

abstract class FirebaseEvents {}

class FetchDataEvent extends FirebaseEvents {}

class AddCloudDataEvent extends FirebaseEvents {
  final String name;
  final String email;

  AddCloudDataEvent({required this.name, required this.email});
}
