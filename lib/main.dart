import 'package:bootcamp_f32/features/app/choose_correct_game/choose_correct_game.dart';
import 'package:bootcamp_f32/features/app/how_many_image_game/how_many_image_game.dart';
import 'package:bootcamp_f32/features/app/how_many_image_game/level_list.dart';
import 'package:bootcamp_f32/features/app/shape_match_game/shape_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/which_one_correct_game/which_one_correct_game.dart';
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
      home: const ShapeMatchGameLevelList()
    );
  }
}
