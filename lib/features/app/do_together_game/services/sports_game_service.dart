import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SportsGameService extends ChangeNotifier {
  int sportsCurrentCard = 0;
}

final sportsGameServiceProvider =
    ChangeNotifierProvider((ref) => SportsGameService());
