import 'dart:convert';

import '../../models/user_model.dart';
import '../constants/app_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveStorageManager {
  static Box hiveBox = Hive.box(AppKeys.kHiveBoxName);

  static openHiveBox() async {
    await Hive.initFlutter();
    await Hive.openBox(AppKeys.kHiveBoxName);
    if (!hiveBox.containsKey(AppKeys.kHiveKeyName)) {
      _createDataList([]);
    }
  }

  static getData() {
    String jsonList = _readData();
    List<dynamic> dynamicList = jsonDecode(jsonList);
    List<UserModel> userList = [];
    if (dynamicList.isNotEmpty) {
      for (var users in dynamicList) {
        UserModel user = UserModel.fromJson(users);
        userList.add(user);
      }
    }
    return userList;
  }

  static addUser(UserModel user) {
    List<UserModel> userList = getData();
    userList.add(user);
    _createDataList(userList);
  }

  static _createDataList(List<UserModel> userList) {
    _saveData(key: AppKeys.kHiveKeyName, userList: userList);
  }

  static _saveData({required String key, required List<UserModel> userList}) {
    List<Map<String, dynamic>> mapList = [];
    if (userList.isNotEmpty) {
      for (UserModel users in userList) {
        Map<String, dynamic> map = UserModel().toJson(users);
        mapList.add(map);
      }
    }
    String jsonList = jsonEncode(mapList);
    hiveBox.put(key, jsonList);
  }

  static _readData() {
    String jsonList = hiveBox.get(AppKeys.kHiveKeyName);
    return jsonList;
  }
}
