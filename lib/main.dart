import 'package:bootcamp_f32/features/app/choose_correct_games/seasonWeather_choose_correct_game/difficulty.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/seasonWeather_choose_correct_game/easy_season_weather_choose_correct_game.dart';
import 'package:bootcamp_f32/features/app/first_page/first-page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      home: const SeasonWeatherChooseCorrectGameDifficulty()
    );
  }
}
