import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/opposition_choose_correct_game/level_list.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/opposition_make_logic_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/opposition_pouch_game/level_list.dart';
import 'package:flutter/material.dart';
import '../../../../common_widgets/app_bar_widget.dart';
import '../../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../../common_widgets/main_pages_background.dart';
import '../../../../common_widgets/main_pages_gridView_widget.dart';

class OppositionGamesPage extends StatefulWidget {
  const OppositionGamesPage({Key? key}) : super(key: key);

  @override
  State<OppositionGamesPage> createState() =>
      _OppositionGamesPageState();
}

final List cards = [
  'assets/images/games_images/alphabet_games/critical-thinking.png',
  'assets/images/games_images/number_games/true-or-false.png',
  'assets/images/games_images/number_games/scrabble.png',
];

final List texts = [
  'MANTIK KURALIM',
  'DOĞRUYU BULALIM',
  'TORBA OYUNU',
];

final List routes = [
  const OppositionMakeLogicGameLevelList(),
  const OppositionChooseCorrectGameLevelList(),
  const OppositionPouchGameLevelList()
];

class _OppositionGamesPageState extends State<OppositionGamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhiteColor,
      appBar: const AppBarWidget(title: 'ZIT KAVRAMLAR',),
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


