import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimalCardGameDataService extends ChangeNotifier{
  int currentAnimal = 0;

}

final animalCardGameDataServiceProvider = ChangeNotifierProvider((ref) => AnimalCardGameDataService());