
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeasonsCardGameDataService extends ChangeNotifier{
  int currentSeason = 0;
  int currentWeather = 0;
}

final seasonCardGameDataServiceProvider = ChangeNotifierProvider((ref) => SeasonsCardGameDataService());