
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClockCardGameDataService extends ChangeNotifier{

  int currentTime = 0;

}

final clockCardGameDataServiceProvider = ChangeNotifierProvider((ref) => ClockCardGameDataService());