import 'package:bootcamp_f32/features/app/choose_correct_games/numbers_choose_correct_game/number_choose_correct_game.dart';
import 'package:bootcamp_f32/features/app/clock_game/level_list.dart';
import 'package:bootcamp_f32/features/app/clock_game/time/time.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/animals_listen_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/body_listen_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/cleaning_listen_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/color_listen_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/emotions_listen_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/letter_listen_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/numbers_listen_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/numbers_listen_match_game/numbers_listen_match_game.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/nutritions_listen_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/profession_listen_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/season_weather_listen_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/shapes_listen_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/things_listen_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/animal_make_logic_game/animal_make_logic_game.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/animal_make_logic_game/level_list.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/body_make_logic_game/level_list.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/cleaning_make_logic_game/level_list.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/colors_make_logic_game/level_list.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/emotions_make_logic_game/level_list.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/emotions_make_logic_game/services/services.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/nutrition_make_logic_game/level_list.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/opposition_make_logic_game/level_list.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/opposition_make_logic_game/opposition_make_logic_game.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/profession_make_logic_game/level_list.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/season_weather_make_logic_game/level_list.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/shapes_make_logic_game/level_list.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/things_make_logic_game/level_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/app/clock_game/time/level_list.dart';
import 'features/app/which_one_correct_game/which_one_correct_game.dart';
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
      home: const ThingsListenMatchGameLevelList()
    );
  }
}
