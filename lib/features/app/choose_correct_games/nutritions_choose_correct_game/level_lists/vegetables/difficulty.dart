import 'package:bootcamp_f32/features/app/choose_correct_games/nutritions_choose_correct_game/level_lists/vegetables/easy_level_list.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/nutritions_choose_correct_game/level_lists/vegetables/hard_level_list.dart';
import 'package:flutter/material.dart';

class VegetablesChooseCorrectGameDifficulty extends StatefulWidget {
  const VegetablesChooseCorrectGameDifficulty({super.key});

  @override
  State<VegetablesChooseCorrectGameDifficulty> createState() => _VegetablesChooseCorrectGameDifficultyState();
}

class _VegetablesChooseCorrectGameDifficultyState extends State<VegetablesChooseCorrectGameDifficulty> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EasyVegetablesChooseCorrectGameLevelList(),));
                              },
                              child: const Image(image: AssetImage('assets/images/difficulty/kolay.png'))),
                          const SizedBox(height: 30,),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HardVegetablesChooseCorrectGameLevelList()));
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
      ),
    );
  }
}
