import 'package:bootcamp_f32/features/app/choose_correct_games/color_choose_correct_game/easy_color_choose_correct_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/utils.dart';
import 'cards_birlikte_yapalım/sports_card_birlikte_yapalım/data/data_sports_birlikte_yapalım.dart';
import 'cards_birlikte_yapalım/sports_card_birlikte_yapalım/services/services.dart';
import 'cards_birlikte_yapalım/sports_card_birlikte_yapalım/sports_card_birlikte_yapalım.dart';
import 'package:bootcamp_f32/features/app/birlikte-yapalım/cards_birlikte_yapalım/services/services.dart';

class SportsListPage extends ConsumerStatefulWidget {
  const SportsListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SportsListPage> createState() => _SportsListPageState();
}

class _SportsListPageState extends ConsumerState<SportsListPage> {
  final List routes = [];
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(SportsBirlikteYapalimDataServiceProvider);
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
              Text('Spor Yapalım',
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
                itemCount: sportsNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        data.sportsCurrentCard = index;
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SportsBirlikteYapalimCard(),
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
                            sportsNames[index],
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
