import 'package:bootcamp_f32/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../common_widgets/app_bar_widget.dart';
import '../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../common_widgets/main_pages_background.dart';
import '../../../common_widgets/main_pages_gridView_widget.dart';

class VucudumuzOyunlariPage extends StatefulWidget {
  const VucudumuzOyunlariPage({Key? key}) : super(key: key);

  @override
  State<VucudumuzOyunlariPage> createState() => _VucudumuzOyunlariPageState();
}

final List cards = [
  'assets/images/oyunlar-images/alfabe-oyunları/critical-thinking.png',
  'assets/images/oyunlar-images/sayı-oyunları/ear.png',
  'assets/images/oyunlar-images/sayı-oyunları/person.png',
  'assets/images/oyunlar-images/sayı-oyunları/true-or-false.png',
  'assets/images/oyunlar-images/sayı-oyunları/scrabble.png',
];

final List texts = [
  'MANTIK KURALIM',
  'DİNLE EŞLEŞTİR',
  'GÖLGE BULMA',
  'DOĞRUYU BULALIM',
  'TORBA OYUNU',
];

final List<String> routes = [];

class _VucudumuzOyunlariPageState extends State<VucudumuzOyunlariPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhiteColor,
      appBar: const AppBarWidget(title: 'VÜCUDUMUZ OYUNLARI',),
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

