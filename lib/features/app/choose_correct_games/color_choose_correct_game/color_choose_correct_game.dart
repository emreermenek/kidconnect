

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:just_audio/just_audio.dart';

import 'data/asset_images.dart';
import 'services/services.dart';


class ColorChooseCorrectGame extends ConsumerStatefulWidget {
  const ColorChooseCorrectGame({Key? key}) : super(key: key);

  @override
  ConsumerState<ColorChooseCorrectGame> createState() =>
      _ColorChooseCorrectGameState();
}

class _ColorChooseCorrectGameState
    extends ConsumerState<ColorChooseCorrectGame> {
  String? firstBalloon;
  String? secondBalloon;

  final _player = AudioPlayer();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(colorChooseCorrectGameServiceProvider);
    final ValueNotifier<int> levels = ValueNotifier<int>(data.currentLevel);
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 234, 206, 100),
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Image(image: AssetImage('assets/images/choose_correct_games/color_choose_correct_game_images/exit.png')),
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                  child:  Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/choose_correct_games/color_choose_correct_game_images/down background.png'),
                          fit: BoxFit.fitWidth
                        )
                      ),
                    ),
              ),
            ],
          ),
        ),
        );
   }
}