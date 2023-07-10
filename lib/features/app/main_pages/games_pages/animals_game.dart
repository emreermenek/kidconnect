import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/animals_choose_correct_game/difficulty.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/animals_listen_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/animal_make_logic_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/animal_pouch_game/level_list.dart';
import 'package:bootcamp_f32/features/app/shadow_games/animals_shadow_game/level_list.dart';
import 'package:bootcamp_f32/features/app/whose_sound_game/level_list.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/app_bar_widget.dart';
import '../../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../../common_widgets/main_pages_background.dart';
import '../../../../common_widgets/main_pages_gridView_widget.dart';

class AnimalGamesPage extends StatefulWidget {
  const AnimalGamesPage({Key? key}) : super(key: key);

  @override
  State<AnimalGamesPage> createState() => _AnimalGamesPageState();
}

final List cards = [
  'assets/images/games_images/alphabet_games/critical-thinking.png',
  'assets/images/games_images/animal_games/problem.png',
  'assets/images/games_images/number_games/person.png',
  'assets/images/games_images/number_games/true-or-false.png',
  'assets/images/games_images/number_games/ear.png',
  'assets/images/games_images/number_games/scrabble.png',
];

final List texts = [
  'MANTIK KURALIM',
  'BU SES KİMİN?',
  'GÖLGE BULMA',
  'DOĞRUYU BULALIM',
  'DİNLE EŞLEŞTİR',
  'TORBA OYUNU',
];

final List routes = [
  const AnimalMakeLogicGameLevelList(),
  const WhoseSoundGameLevelList(),
  const AnimalsShadowGameLevelList(),
  const AnimalChooseCorrectGameDifficulty(),
  const AnimalsListenMatchGameLevelList(),
  const AnimalsPouchGameLevelList()
];

class _AnimalGamesPageState extends State<AnimalGamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhiteColor,
      appBar: const AppBarWidget(title: 'CANLILAR OYUNLARI',),
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

