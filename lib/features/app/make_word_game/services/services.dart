import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MakeWordGameService extends ChangeNotifier{
  List<String> lock =
  [
    'assets/images/level_list/open_lock.png','assets/images/level_list/lock.png',
    'assets/images/level_list/lock.png','assets/images/level_list/lock.png',
    'assets/images/level_list/lock.png', 'assets/images/level_list/lock.png',
    'assets/images/level_list/lock.png', 'assets/images/level_list/lock.png',
    'assets/images/level_list/lock.png','assets/images/level_list/lock.png',
  ];
  void levelLock(int level) {
    lock[level] = 'assets/images/level_list/open_lock.png';
    notifyListeners();
  }
}

final makeWordGameServiceProvider = ChangeNotifierProvider((ref) => MakeWordGameService());