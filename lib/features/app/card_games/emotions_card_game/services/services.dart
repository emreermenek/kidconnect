
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmotionCardGameDataService extends ChangeNotifier{
  int currentEmotion = 0;

}

final emotionCardGameDataServiceProvider = ChangeNotifierProvider((ref) => EmotionCardGameDataService());