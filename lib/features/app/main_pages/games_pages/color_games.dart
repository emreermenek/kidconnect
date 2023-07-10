import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/color_choose_correct_game/difficulty.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/color_listen_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/colors_make_logic_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/color_pouch_game/level_List.dart';
import 'package:flutter/material.dart';
import '../../../../common_widgets/app_bar_widget.dart';
import '../../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../../common_widgets/main_pages_background.dart';
import '../../../../common_widgets/main_pages_gridView_widget.dart';

class ColorGamesPage extends StatefulWidget {
  const ColorGamesPage({Key? key}) : super(key: key);

  @override
  State<ColorGamesPage> createState() => _ColorGamesPageState();
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
  const ColorsMakeLogicGameLevelList(),
  const ColorListenMatchGameLevelList(),
  const ColorPouchGameLevelList(),
  const ColorChooseCorrectGameDifficulty()
];

class _ColorGamesPageState extends State<ColorGamesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tWhiteColor,
        appBar: const AppBarWidget(title: 'RENK OYUNLARI',),
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

