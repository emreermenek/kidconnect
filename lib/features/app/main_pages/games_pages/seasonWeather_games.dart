import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/seasonWeather_choose_correct_game/difficulty.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/season_weather_listen_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/season_weather_make_logic_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/seasonWeather_pouch_game/level_list.dart';
import 'package:bootcamp_f32/features/app/shadow_games/seasonWeather_shadow_game/level_list.dart';
import 'package:flutter/material.dart';
import '../../../../common_widgets/app_bar_widget.dart';
import '../../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../../common_widgets/main_pages_background.dart';
import '../../../../common_widgets/main_pages_gridView_widget.dart';

class SeasonWeatherGamesPage extends StatefulWidget {
  const SeasonWeatherGamesPage({Key? key}) : super(key: key);

  @override
  State<SeasonWeatherGamesPage> createState() => _SeasonWeatherGamesPageState();
}

final List cards = [
  'assets/images/games_images/alphabet_games/critical-thinking.png',
  'assets/images/games_images/number_games/person.png',
  'assets/images/games_images/number_games/true-or-false.png',
  'assets/images/games_images/number_games/ear.png',
  'assets/images/games_images/number_games/scrabble.png',
];

final List texts = [
  'MANTIK KURALIM',
  'GÖLGE BULMA',
  'DOĞRUYU BULALIM',
  'DİNLE EŞLEŞTİR',
  'TORBA OYUNU',
];

final List routes = [
  const SeasonWeatherMakeLogicGameLevelList(),
  const SeasonWeatherShadowGameLevelList(),
  const SeasonWeatherChooseCorrectGameDifficulty(),
  const SeasonWeatherListenMatchGameLevelList(),
  const SeasonWeatherPouchGameLevelList()
];

class _SeasonWeatherGamesPageState extends State<SeasonWeatherGamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhiteColor,
      appBar: const AppBarWidget(title: 'HAVA DURUMU OYUNLARI',),
      bottomNavigationBar: botNavBar(currentIndex: 0,context: context),
      body: Stack(
        children: [
          const MainPagesBackground(),
          GridViewWidget(context: context,texts: texts,cards: cards, routes: routes,),
        ],
      ),
    );
  }
}

