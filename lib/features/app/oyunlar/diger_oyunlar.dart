import 'package:bootcamp_f32/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:bootcamp_f32/features/app/first_page/first-page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common_widgets/app_bar_widget.dart';
import '../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../common_widgets/main_pages_background.dart';
import '../../../common_widgets/main_pages_gridView_widget.dart';

class DigerOyunlarPage extends StatefulWidget {
  const DigerOyunlarPage({Key? key}) : super(key: key);

  @override
  State<DigerOyunlarPage> createState() => _DigerOyunlarPageState();
}

final List cards = [
  'assets/images/oyunlar-images/diger-oyunları/language.png',
  'assets/images/oyunlar-images/diger-oyunları/Group3.png',
];

final List texts = [
  'KAFİYE EŞLEŞTİRME',
  'SÖZCÜK OLUŞTUMA',
];

final List<String> routes = [];

class _DigerOyunlarPageState extends State<DigerOyunlarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhiteColor,
      appBar: const AppBarWidget(title: 'DİĞER OYUNLAR',),
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

