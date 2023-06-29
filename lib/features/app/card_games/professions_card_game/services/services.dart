
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfessionCardGameDataService extends ChangeNotifier{
  int currentProfession = 0;

}

final professionCardGameDataServiceProvider = ChangeNotifierProvider((ref) => ProfessionCardGameDataService());