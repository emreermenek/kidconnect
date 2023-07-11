import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/main_pages/games_pages/animals_game.dart';
import 'package:bootcamp_f32/features/app/main_pages/games_pages/cleaning_games.dart';
import 'package:bootcamp_f32/features/app/main_pages/games_pages/color_games.dart';
import 'package:bootcamp_f32/features/app/main_pages/games_pages/emotions_games.dart';
import 'package:bootcamp_f32/features/app/main_pages/games_pages/letter_games.dart';
import 'package:bootcamp_f32/features/app/main_pages/games_pages/number_games.dart';
import 'package:bootcamp_f32/features/app/main_pages/games_pages/nutrition_games.dart';
import 'package:bootcamp_f32/features/app/main_pages/games_pages/opposition_games.dart';
import 'package:bootcamp_f32/features/app/main_pages/games_pages/other_games.dart';
import 'package:bootcamp_f32/features/app/main_pages/games_pages/profession_games.dart';
import 'package:bootcamp_f32/features/app/main_pages/games_pages/seasonWeather_games.dart';
import 'package:bootcamp_f32/features/app/main_pages/games_pages/shape_games.dart';
import 'package:bootcamp_f32/features/app/main_pages/games_pages/thing_games.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/app_bar_widget.dart';
import '../../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../../common_widgets/main_pages_background.dart';
import '../../../../common_widgets/main_pages_gridView_widget.dart';
import 'body_games.dart';


class GamesMainPage extends StatefulWidget {
  const GamesMainPage({Key? key}) : super(key: key);

  @override
  State<GamesMainPage> createState() => _GamesMainPageState();
}

final List cards = [
  'assets/images/lets_learn_images/alfabe.png',
  'assets/images/lets_learn_images/beslenme.png',
  'assets/images/lets_learn_images/vücudumuz.png',
  'assets/images/lets_learn_images/canlılar.png',
  'assets/images/lets_learn_images/temizlik.png',
  'assets/images/lets_learn_images/sayılar.png',
  'assets/images/lets_learn_images/esyalar.png',
  'assets/images/lets_learn_images/duygu ve davranis.png',
  'assets/images/lets_learn_images/zıt kavramlar.png',
  'assets/images/lets_learn_images/meslekler.png',
  'assets/images/lets_learn_images/şekiller.png',
  'assets/images/lets_learn_images/renkler.png',
  'assets/images/lets_learn_images/hava durumu.png',
  'assets/images/games_images/goods 1.png'
];

final List texts = [
  'ALFABE',
  'BESLENME',
  'VÜCUDUMUZ',
  'CANLILAR',
  'TEMİZLİK',
  'SAYILAR',
  'EŞYALAR',
  'DUYGULAR',
  'ZIT KAVRAMLAR',
  'MESLEKLER',
  'ŞEKİLLER',
  'RENKLER',
  'HAVA DURUMU',
  'DİĞER OYUNLAR'
];

final List routes = [
  const LetterGamesPage(),
  const NutritionGamesPage(),
  const BodyGamesPage(),
  const AnimalGamesPage(),
  const CleaningGamesPage(),
  const NumberGamesPage(),
  const ThingGamesPage(),
  const EmotionsGamesPage(),
  const OppositionGamesPage(),
  const ProfessionGamesPage(),
  const ShapeGamesPage(),
  const ColorGamesPage(),
  const SeasonWeatherGamesPage(),
  const OtherGamesPage(),
];

class _GamesMainPageState extends State<GamesMainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tWhiteColor,
        appBar: const AppBarWidget(title: 'OYUNLAR',),
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

