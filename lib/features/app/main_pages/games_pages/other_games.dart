import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/make_word_game/level_list.dart';
import 'package:flutter/material.dart';
import '../../../../common_widgets/app_bar_widget.dart';
import '../../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../../common_widgets/main_pages_background.dart';
import '../../../../common_widgets/main_pages_gridView_widget.dart';
import '../../shape_match_game/shape_match_game/level_list.dart';

class OtherGamesPage extends StatefulWidget {
  const OtherGamesPage({Key? key}) : super(key: key);

  @override
  State<OtherGamesPage> createState() => _OtherGamesPageState();
}

final List cards = [
  'assets/images/games_images/other_games/language.png',
  'assets/images/games_images/other_games/Group3.png',
];

final List texts = [
  'KAFİYE EŞLEŞTİRME',
  'SÖZCÜK OLUŞTUMA',
];

final List routes = [
  const ShapeMatchGameLevelList(),
  const MakeWordGameLevelList()
];

class _OtherGamesPageState extends State<OtherGamesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tWhiteColor,
        appBar: const AppBarWidget(
          title: 'DİĞER OYUNLAR',
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
