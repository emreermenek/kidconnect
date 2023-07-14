import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/nutritions_listen_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/make_logic_game/nutrition_make_logic_game/level_list.dart';
import 'package:bootcamp_f32/features/app/shadow_games/nutritions_shadow_game/level_list.dart';
import 'package:flutter/material.dart';
import '../../../../common_widgets/app_bar_widget.dart';
import '../../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../../common_widgets/main_pages_background.dart';
import '../../../../common_widgets/main_pages_gridView_widget.dart';
import '../../choose_correct_games/nutritions_choose_correct_game/nutritions_game_list.dart';
import '../../pouch_games/nutrition_pouch_game/level_list.dart';

class NutritionGamesPage extends StatefulWidget {
  const NutritionGamesPage({Key? key}) : super(key: key);

  @override
  State<NutritionGamesPage> createState() => _NutritionGamesPageState();
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
  const NutritionMakeLogicGameLevelList(),
  const NutritionsListenMatchGameLevelList(),
  const NutritionsShadowGameLevelList(),
  const NutritionChooseCorrectGameLevelList(),
  const NutritionPouchGameLevelList()
];

class _NutritionGamesPageState extends State<NutritionGamesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tWhiteColor,
        appBar: const AppBarWidget(
          title: 'BESLENME',
        ),
        bottomNavigationBar: botNavBar(currentIndex: 0, context: context),
        body: Stack(
          children: [
            const MainPagesBackground(),
            GridViewWidget(
              context: context,
              texts: texts,
              cards: cards,
              routes: routes,
            ),
          ],
        ),
      ),
    );
  }
}
