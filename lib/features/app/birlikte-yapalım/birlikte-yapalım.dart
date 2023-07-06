import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/birlikte-yapal%C4%B1m/sports_birlikte_yapal%C4%B1m.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common_widgets/app_bar_widget.dart';
import '../../../common_widgets/bottom_navigation_bar_widget.dart';
import '../../../common_widgets/main_pages_background.dart';
import '../../../common_widgets/main_pages_gridView_widget.dart';
import 'gör_ve_yap_birlikte_yapalım.dart';

class BirlikteYapalimPage extends StatefulWidget {
  const BirlikteYapalimPage({Key? key}) : super(key: key);

  @override
  State<BirlikteYapalimPage> createState() => _BirlikteYapalimPageState();
}

final List cards = [
  'assets/images/birlikte_yapalım/Group 330.png',
  'assets/images/birlikte_yapalım/spor yapalım.png'
];

final List texts = [
  '',
  '',
];

final List routes = [const GorVeYapListPage(), const SportsListPage()];

class _BirlikteYapalimPageState extends State<BirlikteYapalimPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: const AppBarWidget(
        title: 'Birlikte Yapalım',
      ),
      bottomNavigationBar: botNavBar(currentIndex: 0, context: context),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const GorVeYapListPage(),
                      )),
                  child: const Image(
                    image: AssetImage(
                        'assets/images/do_together_images/background/gör ve yap.png'),
                    width: 265,
                    height: 185,
                  )),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SportsListPage(),
                      )),
                  child: const Image(
                    image: AssetImage(
                        'assets/images/do_together_images/background/spor yapalım.png'),
                    width: 265,
                    height: 185,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
