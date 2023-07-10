import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/card_games/nutrition_card_game/data/vegetables.dart';
import 'package:bootcamp_f32/features/app/card_games/nutrition_card_game/nutrition_card_games/vegetables_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/nutrition_card_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class VegetablesCardGameLevelList extends ConsumerStatefulWidget {
  const VegetablesCardGameLevelList({Key? key}) : super(key: key);

  @override
  ConsumerState<VegetablesCardGameLevelList> createState() =>
      _VegetablesCardGameLevelListState();
}

class _VegetablesCardGameLevelListState
    extends ConsumerState<VegetablesCardGameLevelList> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(nutritionCardGameDataServiceProvider);
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
              Text('SEBZELER',
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
        backgroundColor: tWhiteColor,
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
                itemCount: vegetableNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        data.currentVegetables = index;
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const VegetablesCardGame(),
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: tPrimaryColor,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(3, 4))
                          ]),
                      child: Center(
                        child: Text(
                          vegetableNames[index],
                          style: GoogleFonts.comfortaa(
                            textStyle: const TextStyle(
                                color: Colors.black,
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
