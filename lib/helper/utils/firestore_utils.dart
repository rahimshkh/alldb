import '../constants/app_keys.dart';
import '../../models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreUtils {
  static final db = FirebaseFirestore.instance;

  static saveData({required UserModel user}) {
    Map<String, dynamic> userMap = UserModel().toJson(user);
    db.collection(AppKeys.kFireStoreCollections).add(userMap);
  }

  static fetchData() async {
    CollectionReference usersCollection = db.collection(AppKeys.kFireStoreCollections);
    QuerySnapshot usersQuerySnapshot = await usersCollection.get();
    return usersQuerySnapshot;
  }
}
