import 'package:alldb/views/widgets/empty_list_text.dart';
import 'package:alldb/views/widgets/user_tile.dart';
import 'package:flutter/widgets.dart';

import '../../models/user_model.dart';

class UsersList extends StatelessWidget {
  final List<UserModel> userList;

  const UsersList({super.key, required this.userList});

  @override
  Widget build(BuildContext context) {
    if (userList.isEmpty) {
      return const EmptyListText();
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: userList.length,
          itemBuilder: (context, index) {
            UserModel user = userList[index];
            return UserTile(user: user);
          });
    }
  }
}
