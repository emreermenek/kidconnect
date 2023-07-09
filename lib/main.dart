import 'package:bootcamp_f32/features/app/card_games/animal_card_game/level_list.dart';
import 'package:bootcamp_f32/features/app/lyrics_game/lyrics.dart';
import 'package:bootcamp_f32/features/app/shadow_games/animals_shadow_game/animals_shadow_game.dart';
import 'package:bootcamp_f32/features/app/shadow_games/animals_shadow_game/level_list.dart';
import 'package:bootcamp_f32/features/app/shadow_games/letter_shadow_game/letter_shadow_game.dart';
import 'package:bootcamp_f32/features/app/shadow_games/letter_shadow_game/level_list.dart';
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
      home: const AnimalsShadowGameLevelList()
    );
  }
}
