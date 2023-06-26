import 'package:bootcamp_f32/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../common_widgets/app_bar_widget.dart';
import '../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../common_widgets/main_pages_background.dart';
import '../../../common_widgets/main_pages_gridView_widget.dart';

class SayiOyunlariPage extends StatefulWidget {
  const SayiOyunlariPage({Key? key}) : super(key: key);

  @override
  State<SayiOyunlariPage> createState() => _SayiOyunlariPageState();
}

final List cards = [
  'assets/images/oyunlar-images/sayı-oyunları/magnifier.png',
  'assets/images/oyunlar-images/sayı-oyunları/Group-2.png',
  'assets/images/oyunlar-images/sayı-oyunları/Group.png',
  'assets/images/oyunlar-images/sayı-oyunları/true-or-false.png',
  'assets/images/oyunlar-images/sayı-oyunları/alarm.png',
  'assets/images/oyunlar-images/sayı-oyunları/person.png',
  'assets/images/oyunlar-images/sayı-oyunları/ear.png',
  'assets/images/oyunlar-images/sayı-oyunları/scrabble.png',
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

final List<String> routes = [];

class _SayiOyunlariPageState extends State<SayiOyunlariPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhiteColor,
      appBar: const AppBarWidget(title: 'SAYI OYUNLARI',),
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

