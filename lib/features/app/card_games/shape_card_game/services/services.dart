
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShapeCardGameDataService extends ChangeNotifier{
  int currentShape = 0;

}

final shapeCardGameDataServiceProvider = ChangeNotifierProvider((ref) => ShapeCardGameDataService());