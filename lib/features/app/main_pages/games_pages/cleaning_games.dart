import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/cleaning_choose_correct_game/difficulty.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/cleaning_make_logic_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/cleaning_pouch_game/level_list.dart';
import 'package:flutter/material.dart';
import '../../../../common_widgets/app_bar_widget.dart';
import '../../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../../common_widgets/main_pages_background.dart';
import '../../../../common_widgets/main_pages_gridView_widget.dart';

class CleaningGamesPage extends StatefulWidget {
  const CleaningGamesPage({Key? key}) : super(key: key);

  @override
  State<CleaningGamesPage> createState() => _CleaningGamesPageState();
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
  const CleaningMakeLogicGameLevelList(),
  const CleaningChooseCorrectGameDifficulty(),
  const CleaningPouchGameLevelList()
];

class _CleaningGamesPageState extends State<CleaningGamesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tWhiteColor,
        appBar: const AppBarWidget(title: 'TEMİZLİK OYUNLARI',),
        bottomNavigationBar: botNavBar(currentIndex: 0,context: context),
        body: Stack(
          children: [
            const MainPagesBackground(),
            GridViewWidget(context: context,texts: texts,cards: cards, routes: routes,),
          ],
        ),
      ),
    );
  }
}

