import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/emotions_choose_correct_game/difficulty.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/emotions_listen_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/emotions_make_logic_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/emotions_pouch_game/level_list.dart';
import 'package:flutter/material.dart';
import '../../../../common_widgets/app_bar_widget.dart';
import '../../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../../common_widgets/main_pages_background.dart';
import '../../../../common_widgets/main_pages_gridView_widget.dart';

class EmotionsGamesPage extends StatefulWidget {
  const EmotionsGamesPage({Key? key}) : super(key: key);

  @override
  State<EmotionsGamesPage> createState() =>
      _EmotionsGamesPageState();
}

final List cards = [
  'assets/images/games_images/alphabet_games/critical-thinking.png',
  'assets/images/games_images/number_games/ear.png',
  'assets/images/games_images/number_games/scrabble.png',
  'assets/images/games_images/number_games/true-or-false.png',
];

final List texts = [
  'MANTIK KURALIM',
  'DİNLE EŞLEŞTİR',
  'TORBA OYUNU',
  'DOĞRUYU BULALIM',
];

final List routes = [
  const EmotionMakeLogicGameLevelList(),
  const EmotionsListenMatchGameLevelList(),
  const EmotionsPouchGameLevelList(),
  const EmotionsChooseCorrectGameDifficulty()
];

class _EmotionsGamesPageState
    extends State<EmotionsGamesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tWhiteColor,
        appBar: const AppBarWidget(title: 'DUYGU-DAVRANIŞ',),
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


