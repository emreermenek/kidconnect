import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SportsBirlikteYapalimDataService extends ChangeNotifier {
  int currentCard = 0;
}

final SportsBirlikteYapalimDataServiceProvider =
    ChangeNotifierProvider((ref) => SportsBirlikteYapalimDataService());
