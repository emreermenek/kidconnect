
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NutritionCardGameDataService extends ChangeNotifier{
  int currentFoods = 0;
  int currentFruits = 0;
  int currentVegetables = 0;

}

final nutritionCardGameDataServiceProvider = ChangeNotifierProvider((ref) => NutritionCardGameDataService());