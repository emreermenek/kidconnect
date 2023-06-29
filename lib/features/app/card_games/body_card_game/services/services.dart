import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BodyCardGameDataService extends ChangeNotifier{
  int currentBody = 0;

}

final bodyCardGameDataServiceProvider = ChangeNotifierProvider((ref) => BodyCardGameDataService());