import 'package:bootcamp_f32/features/app/choose_correct_games/animals_choose_correct_game/difficulty.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/animals_choose_correct_game/easy_animal_choose_correct_game.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/cleaning_choose_correct_game/difficulty.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/nutritions_choose_correct_game/games/foods/easy_food_choose_correct_game.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/nutritions_choose_correct_game/games/foods/hard_food_choose_correct_game.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/nutritions_choose_correct_game/games/fruits/easy_fruit_choose_correct_game.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/nutritions_choose_correct_game/games/fruits/hard_fruit_choose_correct_game.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/nutritions_choose_correct_game/games/vegetables/easy_vegetables_choose_correct_game.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/nutritions_choose_correct_game/games/vegetables/hard_vegetables_choose_correct_game.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/nutritions_choose_correct_game/level_lists/foods/easy_level_list.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/nutritions_choose_correct_game/level_lists/fruits/easy_level_list.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/nutritions_choose_correct_game/level_lists/vegetables/easy_level_list.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/nutritions_choose_correct_game/nutritions_game_list.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/nutritions_choose_correct_game/services/vegetables_services.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/professions_choose_correct_game/difficulty.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/professions_choose_correct_game/easy_level_list.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/professions_choose_correct_game/easy_profession_choose_correct_game.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/professions_choose_correct_game/hard_level_list.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/professions_choose_correct_game/hard_profession_choose_correct_game.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/seasonWeather_choose_correct_game/difficulty.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/seasonWeather_choose_correct_game/easy_season_weather_choose_correct_game.dart';
import 'package:bootcamp_f32/features/app/first_page/first-page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/app/choose_correct_games/color_choose_correct_game/difficulty.dart';
import 'features/app/choose_correct_games/color_choose_correct_game/easy_level_list.dart';
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
      home: const CleaningChooseCorrectGameDifficulty()
    );
  }
}
