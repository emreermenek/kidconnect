import 'package:bootcamp_f32/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/app_bar_widget.dart';
import '../../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../../common_widgets/main_pages_background.dart';
import '../../../../common_widgets/main_pages_gridView_widget.dart';

class VocalizingPage extends StatefulWidget {
  const VocalizingPage({Key? key}) : super(key: key);

  @override
  State<VocalizingPage> createState() => _VocalizingPageState();
}

final List cards = [
  'assets/images/vocalizing_images/CUMLE.png',
  'assets/images/vocalizing_images/HIKAYE.png',
];

final List texts = [
  'CÜMLE SESLENDİRME',
  'HİKAYE',
];

final List<String> routes = [];

class _VocalizingPageState extends State<VocalizingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhiteColor,
      appBar: const AppBarWidget(title: 'SESLENDİRME',),
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
