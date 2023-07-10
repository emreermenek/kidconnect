import 'package:bootcamp_f32/features/app/card_games/animal_card_game/level_list.dart';
import 'package:bootcamp_f32/features/app/first_page/first-page.dart';
import 'package:bootcamp_f32/features/app/lyrics_game/lyrics.dart';
import 'package:bootcamp_f32/features/app/pouch_games/animal_pouch_game/animal_pouch_game.dart';
import 'package:bootcamp_f32/features/app/pouch_games/animal_pouch_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/body_pouch_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/cleaning_pouch_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/color_pouch_game/level_List.dart';
import 'package:bootcamp_f32/features/app/pouch_games/emotions_pouch_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/letter_pouch_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/numbers_pouch_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/nutrition_pouch_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/opposition_pouch_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/profession_pouch_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/seasonWeather_pouch_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/shapes_pouch_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/things_pouch_game/level_list.dart';
import 'package:bootcamp_f32/features/app/shadow_games/animals_shadow_game/animals_shadow_game.dart';
import 'package:bootcamp_f32/features/app/shadow_games/animals_shadow_game/level_list.dart';
import 'package:bootcamp_f32/features/app/shadow_games/letter_shadow_game/letter_shadow_game.dart';
import 'package:bootcamp_f32/features/app/shadow_games/letter_shadow_game/level_list.dart';
import 'package:bootcamp_f32/features/app/story/start_page.dart';
import 'package:bootcamp_f32/features/authentication/screens/login_page/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/app/pouch_games/numbers_pouch_game/numbers_pouch_game.dart';
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
      home: const ThingsPouchGameLevelList()
    );
  }
}
