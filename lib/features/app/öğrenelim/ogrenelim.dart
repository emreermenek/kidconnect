import 'package:bootcamp_f32/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../common_widgets/app_bar_widget.dart';
import '../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../common_widgets/main_pages_background.dart';
import '../../../common_widgets/main_pages_gridView_widget.dart';

class OgrenelimPage extends StatefulWidget {
  const OgrenelimPage({Key? key}) : super(key: key);

  @override
  State<OgrenelimPage> createState() => _OgrenelimPageState();
}

final List cards = [
  'assets/images/ogrenelim_images/alfabe.png',
  'assets/images/ogrenelim_images/beslenme.png',
  'assets/images/ogrenelim_images/vücudumuz.png',
  'assets/images/ogrenelim_images/canlılar.png',
  'assets/images/ogrenelim_images/temizlik.png',
  'assets/images/ogrenelim_images/sayılar.png',
  'assets/images/ogrenelim_images/esyalar.png',
  'assets/images/ogrenelim_images/duygu ve davranis.png',
  'assets/images/ogrenelim_images/saatler.png',
  'assets/images/ogrenelim_images/hava durumu.png',
  'assets/images/ogrenelim_images/renkler.png',
  'assets/images/ogrenelim_images/meslekler.png',
  'assets/images/ogrenelim_images/şekiller.png',
  'assets/images/ogrenelim_images/zıt kavramlar.png'
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

final List<String> routes = [];

class _OgrenelimPageState extends State<OgrenelimPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhiteColor,
      appBar: const AppBarWidget(title: 'ÖĞRENELİM',),
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

