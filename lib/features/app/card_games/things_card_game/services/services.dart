
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThingsCardGameDataService extends ChangeNotifier{
  int currentThing = 0;

}

final thingsCardGameDataServiceProvider = ChangeNotifierProvider((ref) => ThingsCardGameDataService());