

import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/card_games/clock_card_game/evening_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/clock_card_game/morning_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/clock_card_game/night_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/clock_card_game/noon_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/clock_card_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ClockCardGameLevelList extends ConsumerStatefulWidget {
  const ClockCardGameLevelList({super.key});

  @override
  ConsumerState<ClockCardGameLevelList> createState() => _ClockCardGameLevelListState();
}

class _ClockCardGameLevelListState extends ConsumerState<ClockCardGameLevelList> {
  List navigation = [const MorningCardGame(), const NoonCardGame(), const EveningCardGame(), const NightCardGame()];
  List timeNames = ['SABAH', 'ÖĞLEN', 'AKŞAM', 'GECE'];
  List images =
  [
   'assets/images/card_games/clock_card_game_image/sabah.png',  'assets/images/card_games/clock_card_game_image/oglen.png',
    'assets/images/card_games/clock_card_game_image/aksam.png', 'assets/images/card_games/clock_card_game_image/gece.png'
  ];
  bool isWhite = true;
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(clockCardGameDataServiceProvider);
    final ValueNotifier<bool> whiteNotifier = ValueNotifier<bool>(isWhite);
    return SafeArea(
      child: Scaffold(
        backgroundColor: tWhiteColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 75,
          elevation: 0,
          leading: InkWell(
              onTap: ()
              {
                Navigator.of(context).pop();
              },
              child: const Image(image: AssetImage('assets/images/level_list/exit.png'),width: 100,)
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'SAATLER',
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 24,
                      )
                  )
              ),
              const SizedBox(width: 20,),
              const Image(
                image: AssetImage('assets/images/home_page_image/cute-tiger.png'),
                width: 75,
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 260,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 400
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          data.currentTime = 0;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => navigation[index],));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(images[index]),
                              fit: BoxFit.fill
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: const Offset(
                                      3,
                                      4
                                  )
                              )
                            ]
                          ),
                          child:  Center(
                            child: ValueListenableBuilder(
                                valueListenable: whiteNotifier,
                                builder: (BuildContext context, value, Widget? child) {
                                  if(index>1){
                                    return  Text(timeNames[index],
                                        style: GoogleFonts.comfortaa(
                                          textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                              fontWeight: FontWeight.bold
                                          )
                                        ),
                                    );
                                  }else{
                                    return  Text(timeNames[index],
                                    style: GoogleFonts.comfortaa(
                                        textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 30,
                                          fontWeight: FontWeight.bold
                                        )
                                    ),
                                    );
                                  }

                                }
                            ),
                          ),
                        ),
                      );
                    },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
