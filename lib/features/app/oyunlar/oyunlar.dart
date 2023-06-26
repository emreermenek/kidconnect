import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/oyunlar/renk_oyunlari.dart';
import 'package:bootcamp_f32/features/app/oyunlar/sayi_oyunlari.dart';
import 'package:bootcamp_f32/features/app/oyunlar/sekiller_oyunlari.dart';
import 'package:bootcamp_f32/features/app/oyunlar/temizlik_oyunlari.dart';
import 'package:bootcamp_f32/features/app/oyunlar/vucudumuz_oyunlari.dart';
import 'package:bootcamp_f32/features/app/oyunlar/zit_kavramlar_oyunlari.dart';
import 'package:flutter/material.dart';
import '../../../common_widgets/app_bar_widget.dart';
import '../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../common_widgets/main_pages_background.dart';
import '../../../common_widgets/main_pages_gridView_widget.dart';
import 'alfabe_oyunlari.dart';
import 'beslenme_oyunlari.dart';
import 'canlilar_oyunlari.dart';
import 'diger_oyunlar.dart';
import 'duyguvedavranis_oyunlari.dart';
import 'esya_oyunlari.dart';
import 'havadurumu_oyunlari.dart';
import 'meslek_oyunlari.dart';

class OyunlarPage extends StatefulWidget {
  const OyunlarPage({Key? key}) : super(key: key);

  @override
  State<OyunlarPage> createState() => _OyunlarPageState();
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
  'assets/images/ogrenelim_images/zıt kavramlar.png',
  'assets/images/ogrenelim_images/meslekler.png',
  'assets/images/ogrenelim_images/şekiller.png',
  'assets/images/ogrenelim_images/renkler.png',
  'assets/images/ogrenelim_images/hava durumu.png',
  'assets/images/oyunlar-images/goods 1.png'
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
  'ZIT KAVRAMLAR',
  'MESLEKLER',
  'ŞEKİLLER',
  'RENKLER',
  'HAVA DURUMU',
  'DİĞER OYUNLAR'
];

final List routes = [
  const AlfabeOyunlariPage(),
  const BeslenmeOyunlariPage(),
  const VucudumuzOyunlariPage(),
  const CanlilarOyunlariPage(),
  const TemizlikOyunlariPage(),
  const SayiOyunlariPage(),
  const EsyaOyunlariPage(),
  const DuyguveDavranisOyunlariPage(),
  const ZitKavramlarOyunlariPage(),
  const MeslekOyunlariPage(),
  const SekilOyunlariPage(),
  const RenkOyunlariPage(),
  const HavaDurumuOyunlariPage(),
  const DigerOyunlarPage(),
];

class _OyunlarPageState extends State<OyunlarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhiteColor,
      appBar: const AppBarWidget(title: 'OYUNLAR',),
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

