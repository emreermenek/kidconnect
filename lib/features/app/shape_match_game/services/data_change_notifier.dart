

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class DataChangeNotifier extends ChangeNotifier{

  Offset? firstStartPoint;
  Offset? firstEndPoint;
  Offset? secondStartPoint;
  Offset? secondEndPoint;
  Offset? thirdStartPoint;
  Offset? thirdEndPoint;
  int points = 0;
  double healthes = 3;
  bool isFirstClicked = false;
  bool isSecondClicked = false;
  bool isThirdClicked = false;
  int currentLevel = 0;
  bool? finished;
  int lockLevel = 0;

  void resetGame()
  {
    firstStartPoint = null;
    firstEndPoint = null;
    secondStartPoint = null;
    secondEndPoint = null;
    thirdStartPoint = null;
    thirdEndPoint = null;
    isFirstClicked = false;
    isSecondClicked = false;
    isThirdClicked = false;
    points = 0;
    healthes = 3;
    finished = null;
    notifyListeners();
  }


  void levelUp(){
    currentLevel += 1;
    notifyListeners();
  }

  void chooseLevel(int level){
    currentLevel = level;
    notifyListeners();
  }
  List<String> lock =
  [
    'assets/images/level_list/open_lock.png','assets/images/level_list/lock.png',
    'assets/images/level_list/lock.png','assets/images/level_list/lock.png',
    'assets/images/level_list/lock.png', 'assets/images/level_list/lock.png',
    'assets/images/level_list/lock.png', 'assets/images/level_list/lock.png',
    'assets/images/level_list/lock.png', 'assets/images/level_list/lock.png'
  ];
  void levelLock() {
    lock[lockLevel] = 'assets/images/level_list/open_lock.png';
    notifyListeners();
  }

}

final dataChangeNotifierProvider = ChangeNotifierProvider((ref) => DataChangeNotifier());