import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/biger_or_lower_game/level_list.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/numbers_choose_correct_game/level_list.dart';
import 'package:bootcamp_f32/features/app/clock_game/level_list.dart';
import 'package:bootcamp_f32/features/app/how_many_image_game/level_list.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/numbers_listen_match_game/level_list.dart';
import 'package:bootcamp_f32/features/app/pouch_games/numbers_pouch_game/level_list.dart';
import 'package:bootcamp_f32/features/app/shadow_games/numbers_shadow_game/level_list.dart';
import 'package:bootcamp_f32/features/app/which_one_correct_game/level_list.dart';
import 'package:flutter/material.dart';
import '../../../../common_widgets/app_bar_widget.dart';
import '../../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../../common_widgets/main_pages_background.dart';
import '../../../../common_widgets/main_pages_gridView_widget.dart';

class NumberGamesPage extends StatefulWidget {
  const NumberGamesPage({Key? key}) : super(key: key);

  @override
  State<NumberGamesPage> createState() => _NumberGamesPageState();
}

final List cards = [
  'assets/images/games_images/number_games/magnifier.png',
  'assets/images/games_images/number_games/Group-2.png',
  'assets/images/games_images/number_games/Group.png',
  'assets/images/games_images/number_games/true-or-false.png',
  'assets/images/games_images/number_games/alarm.png',
  'assets/images/games_images/number_games/person.png',
  'assets/images/games_images/number_games/ear.png',
  'assets/images/games_images/number_games/scrabble.png',
];

final List texts = [
  'KAYIP SAYI',
  'KAÇ TANE VAR',
  'BÜYÜK MÜ? KÜÇÜK MÜ?',
  'DOĞRUYU BULALIM',
  'SAATLER',
  'GÖLGE BULMA',
  'DİNLE EŞLEŞTİR',
  'TORBA OYUNU',
];

final List routes = [
  const WhichOneCorrectGameLevelList(),
  const HowManyImageGameLevelList(),
  const BiggerOrLowerGameLevelList(),
  const NumberChooseCorrectGameLevelList(),
  const ClockGameLevelList(),
  const NumbersShadowGameLevelList(),
  const NumbersListenMatchGameLevelList(),
  const NumbersPouchGameLevelList()
];

class _NumberGamesPageState extends State<NumberGamesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tWhiteColor,
        appBar: const AppBarWidget(title: 'SAYI OYUNLARI',),
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

