import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimalsPouchGameDataService extends ChangeNotifier{
  int currentLevel = 0;
  List<int> imageIndexList = List.generate(26, (index) => index);
  List<String> lock =
  [
    'assets/images/level_list/open_lock.png','assets/images/level_list/lock.png',
    'assets/images/level_list/lock.png','assets/images/level_list/lock.png',
    'assets/images/level_list/lock.png','assets/images/level_list/lock.png',
    'assets/images/level_list/lock.png','assets/images/level_list/lock.png',
    'assets/images/level_list/lock.png','assets/images/level_list/lock.png',
    'assets/images/level_list/lock.png','assets/images/level_list/lock.png',
    'assets/images/level_list/lock.png'
  ];
  void levelLock() {
    lock[currentLevel] = 'assets/images/level_list/open_lock.png';
    notifyListeners();
  }

}

final animalsPouchGameDataServiceProvider = ChangeNotifierProvider((ref) => AnimalsPouchGameDataService());