import 'package:bootcamp_f32/features/app/card_games/body_card_game/body_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/cleaning_card_game/level_list.dart';
import 'package:bootcamp_f32/features/app/card_games/clock_card_game/evening_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/clock_card_game/level_list.dart';
import 'package:bootcamp_f32/features/app/card_games/clock_card_game/morning_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/clock_card_game/night_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/clock_card_game/noon_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/black_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/blue_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/brown_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/green_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/orange_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/pink_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/purple_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/red_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/yellow_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/level_list.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/color_choose_correct_game/difficulty.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/color_choose_correct_game/easy_color_choose_correct_game.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/color_choose_correct_game/hard_color_choose_correct_game.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/color_choose_correct_game/hard_level_list.dart';
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
      home: const FirstPage()
    );
  }
}
