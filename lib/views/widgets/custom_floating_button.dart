import 'package:alldb/helper/constants/app_icons.dart';
import 'package:alldb/helper/constants/app_sizes.dart';
import 'package:alldb/views/widgets/alert_utils.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  final double height;
  final double width;
  final String dbLabel;

  const CustomFloatingButton(
      {super.key, required this.height, required this.width, required this.dbLabel});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => AlertUtils.addUser(
          context: context, height: height, width: width, dbLabel: dbLabel),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.kWidgetsRadius)),
      child: const Icon(AppIcons.kFloatingButtonIcon),
    );
  }
}
