import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/letter_choose_correct_game/difficulty.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/letter_listen_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/letter_pouch_game/level_list.dart';
import 'package:bootcamp_f32/features/app/shadow_games/letter_shadow_game/level_list.dart';
import 'package:flutter/material.dart';
import '../../../../common_widgets/app_bar_widget.dart';
import '../../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../../common_widgets/main_pages_background.dart';
import '../../../../common_widgets/main_pages_gridView_widget.dart';

class LetterGamesPage extends StatefulWidget {
  const LetterGamesPage({Key? key}) : super(key: key);

  @override
  State<LetterGamesPage> createState() => _LetterGamesPageState();
}

final List cards = [
  'assets/images/games_images/number_games/ear.png',
  'assets/images/games_images/number_games/person.png',
  'assets/images/games_images/number_games/true-or-false.png',
  'assets/images/games_images/number_games/scrabble.png',
];

final List texts = [
  'DİNLE EŞLEŞTİR',
  'GÖLGE BULMA',
  'DOĞRUYU BULALIM',
  'TORBA OYUNU',
];

final List routes = [
  const LettersListenMatchGameLevelList(),
  const LetterShadowGameLevelList(),
  const LetterChooseCorrectGameDifficulty(),
  const LetterPouchGameLevelList(),
];

class _LetterGamesPageState extends State<LetterGamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhiteColor,
      appBar: const AppBarWidget(title: 'ALFABE OYUNLARI',),
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
