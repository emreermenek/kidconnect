import 'package:bootcamp_f32/features/app/make_word_game/level_list.dart';
import 'package:bootcamp_f32/features/app/story/pages/page_1.dart';
import 'package:bootcamp_f32/features/app/story/start_page.dart';
import 'package:bootcamp_f32/features/app/whose_sound_game/level_list.dart';
import 'package:bootcamp_f32/features/app/whose_sound_game/whose_sound_game.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/app/story/page_flip.dart';
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
      home: const StoryStartPage()
    );
  }
}
