import 'package:bootcamp_f32/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:bootcamp_f32/features/app/first_page/first-page.dart';

import '../../../common_widgets/app_bar_widget.dart';
import '../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../common_widgets/main_pages_background.dart';
import '../../../common_widgets/main_pages_gridView_widget.dart';

class SeslendirmePage extends StatefulWidget {
  const SeslendirmePage({Key? key}) : super(key: key);

  @override
  State<SeslendirmePage> createState() => _SeslendirmePageState();
}

final List cards = [
  'assets/images/seslendirme-images/CUMLE.png',
  'assets/images/seslendirme-images/HIKAYE.png',
];

final List texts = [
  'CÜMLE SESLENDİRME',
  'HİKAYE',
];

final List<String> routes = [];

class _SeslendirmePageState extends State<SeslendirmePage> {
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
