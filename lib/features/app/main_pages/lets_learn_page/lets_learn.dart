import 'package:bootcamp_f32/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../../common_widgets/app_bar_widget.dart';
import '../../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../../common_widgets/main_pages_background.dart';
import '../../../../common_widgets/main_pages_gridView_widget.dart';
import '../../card_games/animal_card_game/level_list.dart';
import '../../card_games/body_card_game/level_list.dart';
import '../../card_games/cleaning_card_game/level_list.dart';
import '../../card_games/clock_card_game/level_list.dart';
import '../../card_games/color_card_game/level_list.dart';
import '../../card_games/emotions_card_game/level_list.dart';
import '../../card_games/letter_game/letter_game.dart';
import '../../card_games/number_game/number_game.dart';
import '../../card_games/nutrition_card_game/level_lists/nutrition_level_list.dart';
import '../../card_games/opposite_card_game/level_list.dart';
import '../../card_games/professions_card_game/level_list.dart';
import '../../card_games/seasonsAndWeather_card_game/seasonAndWeather_level_list.dart';
import '../../card_games/shape_card_game/level_list.dart';
import '../../card_games/things_card_game/level_list.dart';

class LetsLearnPage extends StatefulWidget {
  const LetsLearnPage({Key? key}) : super(key: key);

  @override
  State<LetsLearnPage> createState() => _LetsLearnPageState();
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
  'assets/images/lets_learn_images/saatler.png',
  'assets/images/lets_learn_images/hava durumu.png',
  'assets/images/lets_learn_images/renkler.png',
  'assets/images/lets_learn_images/meslekler.png',
  'assets/images/lets_learn_images/şekiller.png',
  'assets/images/lets_learn_images/zıt kavramlar.png'
];

final List texts = [
  'ALFABE',
  'BESLENME',
  'VÜCUDUMUZ',
  'CANLILAR',
  'TEMİZLİK',
  'SAYILAR',
  'EŞYALAR',
  'DUYGU VE DAVRANIŞ',
  'SAATLER',
  'HAVA DURUMU',
  'RENKLER',
  'MESLEKLER',
  'ŞEKİLLER',
  'ZIT KAVRAMLAR'
];

const List routes = [
  LetterGame(),
  NutritionCardGameLevelList(),
  BodyCardGameLevelList(),
  AnimalCardGameLevelList(),
  CleaningCardGameLevelList(),
  NumberGame(),
  ThingsCardGameLevelList(),
  EmotionCardGameLevelList(),
  ClockCardGameLevelList(),
  SeasonAndWeatherCardGameLevelList(),
  ColorCardGameLevelList(),
  ProfessionCardGameLevelList(),
  ShapeCardGameLevelList(),
  OppositeCardGameLevelList()
];

class _LetsLearnPageState extends State<LetsLearnPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tWhiteColor,
        appBar: const AppBarWidget(title: 'ÖĞRENELİM',),
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

