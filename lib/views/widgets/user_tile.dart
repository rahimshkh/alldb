import '../../helper/constants/app_dimensions.dart';
import '../../helper/constants/app_sizes.dart';

import '../../models/user_model.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final UserModel user;

  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.fromLTRB(width * AppDimension.kWidgetsSpacing,
          width * AppDimension.kWidgetsSpacing, width * AppDimension.kWidgetsSpacing, 0),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor.withOpacity(0.1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.kWidgetsRadius)),
        titleTextStyle:
            TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w800),
        title: Text(user.name!),
        subtitle: (user.email != null) ? Text(user.email!) : const SizedBox(),
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.kWidgetsRadius),
            child: user.avatar != null && user.avatar!.isNotEmpty
                ? Image.network(user.avatar!)
                : CircleAvatar(
                    child: Text(
                      user.name![0].toUpperCase(),
                      style: TextStyle(
                          color: Theme.of(context).cardColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
      ),
    );
  }
}
