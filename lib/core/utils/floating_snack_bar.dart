import 'package:flutter/material.dart';

class FloatingSnackBar {
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String message) {
    scaffoldKey.currentState?.clearSnackBars();
    scaffoldKey.currentState?.showSnackBar(SnackBar(
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      dismissDirection: DismissDirection.none,
      duration: const Duration(seconds: 1),
      content: Center(child: Text(message)),
    ));
  }
}
