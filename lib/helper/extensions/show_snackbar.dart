import 'package:flutter/material.dart';

extension SnackBarExtension on String {
  showSnackBar(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        this,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    ));
  }
}
