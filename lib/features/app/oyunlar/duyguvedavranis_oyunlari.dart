import 'package:bootcamp_f32/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../common_widgets/app_bar_widget.dart';
import '../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../common_widgets/main_pages_background.dart';
import '../../../common_widgets/main_pages_gridView_widget.dart';

class DuyguveDavranisOyunlariPage extends StatefulWidget {
  const DuyguveDavranisOyunlariPage({Key? key}) : super(key: key);

  @override
  State<DuyguveDavranisOyunlariPage> createState() =>
      _DuyguveDavranisOyunlariPageState();
}

final List cards = [
  'assets/images/oyunlar-images/alfabe-oyunları/critical-thinking.png',
  'assets/images/oyunlar-images/sayı-oyunları/ear.png',
  'assets/images/oyunlar-images/sayı-oyunları/scrabble.png',
  'assets/images/oyunlar-images/sayı-oyunları/true-or-false.png',
];

final List texts = [
  'MANTIK KURALIM',
  'DİNLE EŞLEŞTİR',
  'TORBA OYUNU',
  'DOĞRUYU BULALIM',
];

final List<String> routes = [];

class _DuyguveDavranisOyunlariPageState
    extends State<DuyguveDavranisOyunlariPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhiteColor,
      appBar: const AppBarWidget(title: 'DUYGU VE DAVRANIŞ OYUNLARI',),
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


