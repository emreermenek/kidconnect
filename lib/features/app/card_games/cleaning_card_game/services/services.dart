
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CleaningCardGameDataService extends ChangeNotifier{
  int currentCleaning = 0;

}

final cleaningCardGameDataServiceProvider = ChangeNotifierProvider((ref) => CleaningCardGameDataService());