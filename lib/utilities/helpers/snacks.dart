
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Snacks {
  Snacks._();

  static void _showSnack(BuildContext context, String message, Color color) =>
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: color,
            padding: const EdgeInsets.all(10),
            behavior: SnackBarBehavior.floating,
          ),
        );

  static void error(BuildContext context, String message) =>
      _showSnack(context, message, Colors.red);

  static void success(BuildContext context, String message) =>
      _showSnack(context, message, Colors.green);
}