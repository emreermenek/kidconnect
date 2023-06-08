import 'package:flutter/material.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class Utils {
  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
    );

    final scaffoldMessengerState = messengerKey.currentState;
    if (scaffoldMessengerState != null) {
      scaffoldMessengerState
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }
}
