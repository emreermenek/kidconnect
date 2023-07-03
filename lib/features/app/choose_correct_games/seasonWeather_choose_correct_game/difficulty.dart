import 'package:bootcamp_f32/features/app/choose_correct_games/seasonWeather_choose_correct_game/easy_level_list.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/seasonWeather_choose_correct_game/hard_level_list.dart';
import 'package:flutter/material.dart';
class SeasonWeatherChooseCorrectGameDifficulty extends StatefulWidget {
  const SeasonWeatherChooseCorrectGameDifficulty({super.key});

  @override
  State<SeasonWeatherChooseCorrectGameDifficulty> createState() => _SeasonWeatherChooseCorrectGameDifficultyState();
}

class _SeasonWeatherChooseCorrectGameDifficultyState extends State<SeasonWeatherChooseCorrectGameDifficulty> {
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EasySeasonWeatherChooseCorrectGameLevelList(),));
                        },
                        child: const Image(image: AssetImage('assets/images/difficulty/kolay.png'))),
                    const SizedBox(height: 30,),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HardSeasonWeatherChooseCorrectGameLevelList(),));
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
