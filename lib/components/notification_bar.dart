import 'package:flutter/material.dart';

class NotificationBar {
  static void showSnackBar(BuildContext context, String message) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: colorScheme.primary)),
        behavior: SnackBarBehavior.floating,
        // dismissDirection: DismissDirection.horizontal,
        backgroundColor: colorScheme.tertiary,
      ),
    );
  }
}
