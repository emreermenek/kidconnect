import 'package:bootcamp_f32/features/app/card_games/opposite_card_game/data/opposite_back.dart';
import 'package:bootcamp_f32/features/app/card_games/opposite_card_game/opposite_card_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'services/services.dart';

class OppositeCardGameLevelList extends ConsumerStatefulWidget {
  const OppositeCardGameLevelList({Key? key}) : super(key: key);

  @override
  ConsumerState<OppositeCardGameLevelList> createState() =>
      _OppositeCardGameLevelListState();
}

class _OppositeCardGameLevelListState
    extends ConsumerState<OppositeCardGameLevelList> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(oppositeCardGameDataServiceProvider);
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
              Text('ZIT KAVRAMLAR',
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
                    maxCrossAxisExtent: 600,
                    childAspectRatio: 14 / 3,
                    crossAxisSpacing: 8),
                itemCount: twoNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        data.currentOpposite = index;
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OppositeCardGame(),
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xFF4B5D67),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(3, 4))
                          ]),
                      child: Center(
                        child: Text(
                          twoNames[index],
                          style: GoogleFonts.comfortaa(
                            textStyle: const TextStyle(
                                color: Color(0xFFBDF2D5),
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
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
