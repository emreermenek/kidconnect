import 'package:bootcamp_f32/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../common_widgets/app_bar_widget.dart';
import '../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../common_widgets/main_pages_background.dart';
import '../../../common_widgets/main_pages_gridView_widget.dart';

class BoyamaPage extends StatefulWidget {
  const BoyamaPage({Key? key}) : super(key: key);

  @override
  State<BoyamaPage> createState() => _BoyamaPageState();
}

final List cards = [
  'assets/images/sarkilar-images/SARKITAMAM.png',
  'assets/images/sarkılar-images/BIRLIKTESARKI.png',
];

final List texts = [
  'BİRLİKTE ŞARKI SÖYLEYELİM',
  'ŞARKI TAMAMLAMA',
];

final List<String> routes = [];

class _BoyamaPageState extends State<BoyamaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhiteColor,
      appBar: const AppBarWidget(title: 'ŞARKILAR',),
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