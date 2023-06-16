

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

}

final dataChangeNotifierProvider = ChangeNotifierProvider((ref) => DataChangeNotifier());