
import 'package:flutter/material.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class Utils{
  static showSnackBar(String? text){


    if(text==null) return;

    final snackBar = SnackBar(content: Text(text),backgroundColor: Colors.red,duration: const Duration(seconds: 3),);

    messengerKey.currentState!
      ..removeCurrentSnackBar
      ..showSnackBar(snackBar);

  }

}