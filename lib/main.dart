import 'package:bootcamp_f32/features/app/biger_or_lower_game/bigger_or_lower_game.dart';
import 'package:bootcamp_f32/features/app/biger_or_lower_game/level_list.dart';
import 'package:bootcamp_f32/features/app/card_games/animal_card_game/animal_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/animal_card_game/level_list.dart';
import 'package:bootcamp_f32/features/app/choose_correct_game/choose_correct_game.dart';
import 'package:bootcamp_f32/features/app/how_many_image_game/how_many_image_game.dart';
import 'package:bootcamp_f32/features/app/how_many_image_game/level_list.dart';
import 'package:bootcamp_f32/features/app/number_game/number_game.dart';
import 'package:bootcamp_f32/features/app/settings_page/settings_page.dart';
import 'package:bootcamp_f32/features/app/shape_match_game/shape_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/shape_match_game/shape_match_game/shape_match_game.dart';
import 'package:bootcamp_f32/features/app/which_one_correct_game/which_one_correct_game.dart';
import 'package:bootcamp_f32/features/authentication/screens/login_page/login_page.dart';
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
      home: const HowManyImageGameLevelList()
    );
  }
}
