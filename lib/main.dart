import 'package:bootcamp_f32/features/app/card_games/nutrition_card_game/level_lists/foods_level_list.dart';
import 'package:bootcamp_f32/features/app/card_games/nutrition_card_game/level_lists/fruits_level_list.dart';
import 'package:bootcamp_f32/features/app/card_games/nutrition_card_game/level_lists/nutrition_level_list.dart';
import 'package:bootcamp_f32/features/app/card_games/nutrition_card_game/level_lists/vegetables_level_list.dart';
import 'package:bootcamp_f32/features/app/card_games/nutrition_card_game/nutrition_card_games/fruits_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/nutrition_card_game/nutrition_card_games/vegetables_card_game.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const NutritionCardGameLevelList()
    );
  }
}
