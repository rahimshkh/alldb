import 'package:alldb/helper/constants/app_keys.dart';

class UserModel {
  String? name;
  String? email;
  String? avatar;

  UserModel({this.name, this.email, this.avatar = ""});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    String name = json[AppKeys.kUserModelName];
    String email = json[AppKeys.kUserModelEmail];
    String avatar = json[AppKeys.kUserModelAvatar];

    return UserModel(name: name, avatar: avatar, email: email);
  }

  Map<String, dynamic> toJson(UserModel user) {
    String? name = user.name ?? "";
    String? email = user.email ?? "";
    String? avatar = user.avatar ?? "";
    return {
      AppKeys.kUserModelName: name,
      AppKeys.kUserModelAvatar: avatar,
      AppKeys.kUserModelEmail: email,
    };
  }
}
