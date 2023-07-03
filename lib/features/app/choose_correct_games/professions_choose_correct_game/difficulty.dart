import 'package:bootcamp_f32/features/app/choose_correct_games/professions_choose_correct_game/easy_level_list.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/professions_choose_correct_game/hard_level_list.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/seasonWeather_choose_correct_game/easy_level_list.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/seasonWeather_choose_correct_game/hard_level_list.dart';
import 'package:flutter/material.dart';
class ProfessionChooseCorrectGameDifficulty extends StatefulWidget {
  const ProfessionChooseCorrectGameDifficulty({super.key});

  @override
  State<ProfessionChooseCorrectGameDifficulty> createState() => _ProfessionChooseCorrectGameDifficultyState();
}

class _ProfessionChooseCorrectGameDifficultyState extends State<ProfessionChooseCorrectGameDifficulty> {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 120,),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EasyProfessionsChooseCorrectGameLevelList(),));
                        },
                        child: const Image(image: AssetImage('assets/images/difficulty/kolay.png'))),
                    const SizedBox(height: 30,),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HardProfessionChooseCorrectGameLevelList(),));
                        },
                        child: const Image(image: AssetImage('assets/images/difficulty/zor.png'))),
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
