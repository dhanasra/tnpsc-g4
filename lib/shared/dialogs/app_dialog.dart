import 'package:flutter/material.dart';

class AppDialog {
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed:
                    () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }
}