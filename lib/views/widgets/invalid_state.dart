import 'package:flutter/material.dart';

import '../../helper/constants/app_sizes.dart';
import '../../helper/constants/app_strings.dart';

class InvalidState extends StatelessWidget {
  const InvalidState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.kEmptyList,
        style: TextStyle(
          fontSize: AppSizes.kBottomSheetLabel,
          fontWeight: FontWeight.w900,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
