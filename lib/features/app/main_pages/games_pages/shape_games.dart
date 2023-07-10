import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/shapes_choose_correct_game/difficulty.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/shapes_make_logic_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/shapes_pouch_game/level_list.dart';
import 'package:bootcamp_f32/features/app/shadow_games/shapes_shadow_game/level_list.dart';
import 'package:flutter/material.dart';
import '../../../../common_widgets/app_bar_widget.dart';
import '../../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../../common_widgets/main_pages_background.dart';
import '../../../../common_widgets/main_pages_gridView_widget.dart';
import '../../listen_match_games/shapes_listen_match_game/level_list.dart';

class ShapeGamesPage extends StatefulWidget {
  const ShapeGamesPage({Key? key}) : super(key: key);

  @override
  State<ShapeGamesPage> createState() => _ShapeGamesPageState();
}

final List cards = [
  'assets/images/games_images/alphabet_games/critical-thinking.png',
  'assets/images/games_images/number_games/ear.png',
  'assets/images/games_images/number_games/person.png',
  'assets/images/games_images/number_games/true-or-false.png',
  'assets/images/games_images/number_games/scrabble.png',
];

final List texts = [
  'MANTIK KURALIM',
  'DİNLE EŞLEŞTİR',
  'GÖLGE BULMA',
  'DOĞRUYU BULALIM',
  'TORBA OYUNU',
];

final List routes = [
  const ShapesMakeLogicGameLevelList(),
  const ShapesListenMatchGameLevelList(),
  const ShapesShadowGameLevelList(),
  const ShapesChooseCorrectGameDifficulty(),
  const ShapesPouchGameLevelList()
];

class _ShapeGamesPageState extends State<ShapeGamesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tWhiteColor,
        appBar: const AppBarWidget(title: 'ŞEKİLLER OYUNLARI',),
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

