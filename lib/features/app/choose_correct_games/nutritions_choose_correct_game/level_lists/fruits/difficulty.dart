import 'package:bootcamp_f32/features/app/choose_correct_games/nutritions_choose_correct_game/level_lists/fruits/easy_level_list.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/nutritions_choose_correct_game/level_lists/fruits/hard_level_list.dart';
import 'package:flutter/material.dart';

class FruitsChooseCorrectGameDifficulty extends StatefulWidget {
  const FruitsChooseCorrectGameDifficulty({super.key});

  @override
  State<FruitsChooseCorrectGameDifficulty> createState() => _FruitsChooseCorrectGameDifficultyState();
}

class _FruitsChooseCorrectGameDifficultyState extends State<FruitsChooseCorrectGameDifficulty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/difficulty/background.png'),
                      fit: BoxFit.fill
                  )
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Image(image: AssetImage('assets/images/difficulty/maskot.png'),),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Image(image: AssetImage('assets/images/choose_correct_games/color_choose_correct_game_images/exit.png'),),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 120,),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EasyFruitsChooseCorrectGameLevelList(),));
                            },
                            child: const Image(image: AssetImage('assets/images/difficulty/kolay.png'))),
                        const SizedBox(height: 30,),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HardFruitsChooseCorrectGameLevelList()));
                            },
                            child: const Image(image: AssetImage('assets/images/difficulty/zor.png'))),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
