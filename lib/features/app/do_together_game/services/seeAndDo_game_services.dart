import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeeAndDoGameService extends ChangeNotifier {
  int currentCard = 0;
}

final seeAndDoGameServiceProvider =
    ChangeNotifierProvider((ref) => SeeAndDoGameService());
