import 'package:bootcamp_f32/features/app/clock_game/level_list.dart';
import 'package:bootcamp_f32/features/app/clock_game/time/time.dart';
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
      home: const ThingsMakeLogicGameLevelList()
    );
  }
}
