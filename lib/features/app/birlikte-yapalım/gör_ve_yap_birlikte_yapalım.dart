import 'package:bootcamp_f32/features/app/choose_correct_games/color_choose_correct_game/easy_color_choose_correct_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/utils.dart';
import 'cards_birlikte_yapalım/cards-birlikte_yapalım.dart';
import 'cards_birlikte_yapalım/data/data_gor_ve_yap_birlikte_yapalım.dart';
import 'cards_birlikte_yapalım/services/services.dart';
import 'services/services.dart';

class GorVeYapListPage extends ConsumerStatefulWidget {
  const GorVeYapListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<GorVeYapListPage> createState() => _GorVeYapListPageState();
}

class _GorVeYapListPageState extends ConsumerState<GorVeYapListPage> {
  final List routes = [];
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(GorVeYapBirlikteYapalimDataServiceProvider);
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 75,
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Image(
                image: AssetImage('assets/images/level_list/exit.png'),
                width: 100,
              )),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Gör ve Yap',
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 24,
                  ))),
              const SizedBox(
                width: 20,
              ),
              const Image(
                image:
                    AssetImage('assets/images/home_page_image/cute-tiger.png'),
                width: 75,
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xFFBDF2D5),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 550,
                    childAspectRatio: 14 / 3,
                    crossAxisSpacing: 8),
                itemCount: seeAndDoNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        data.currentCard = index;
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const GorveYapBirlikteYapalimCard(),
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(
                        left: 30,
                      ),
                      decoration: BoxDecoration(
                          color: const Color(0xFF4B5D67),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(3, 4))
                          ]),
                      child: Row(
                        children: [
                          Text(
                            seeAndDoNames[index],
                            style: GoogleFonts.comfortaa(
                              textStyle: const TextStyle(
                                  color: Color(0xFFBDF2D5),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
