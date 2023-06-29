
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OppositeCardGameDataService extends ChangeNotifier{
  int currentOpposite = 0;

}

final oppositeCardGameDataServiceProvider = ChangeNotifierProvider((ref) => OppositeCardGameDataService());