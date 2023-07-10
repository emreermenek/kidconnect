import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/coming_soon_screen/coming_soon_screen.dart';
import 'package:bootcamp_f32/features/app/lyrics_game/lyrics.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/app_bar_widget.dart';
import '../../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../../common_widgets/main_pages_background.dart';
import '../../../../common_widgets/main_pages_gridView_widget.dart';

class SongsPage extends StatefulWidget {
  const SongsPage({Key? key}) : super(key: key);

  @override
  State<SongsPage> createState() => _SongsPageState();
}

final List cards = [
  'assets/images/songs_images/BIRLIKTE.png',
  'assets/images/songs_images/SARKITAMAM.png',
];

final List texts = [
  'BİRLİKTE ŞARKI SÖYLEYELİM',
  'ŞARKI TAMAMLAMA',
];

final List routes = [
  const LyricsGame(),
  const ComingSoonScreen()
];

class _SongsPageState extends State<SongsPage> {
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


