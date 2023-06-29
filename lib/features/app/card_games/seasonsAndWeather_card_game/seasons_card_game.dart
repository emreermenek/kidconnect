import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/seasons.dart';
import 'services/services.dart';

class SeasonsCardGame extends ConsumerStatefulWidget {
  const SeasonsCardGame({super.key});

  @override
  ConsumerState<SeasonsCardGame> createState() => _SeasonsCardGameState();
}

class _SeasonsCardGameState extends ConsumerState<SeasonsCardGame> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(seasonCardGameDataServiceProvider);
    final ValueNotifier<int> chooseSeason = ValueNotifier<int>(data.currentSeason);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEFE9AF),
        body: ValueListenableBuilder(
            valueListenable: chooseSeason,
            builder: (BuildContext context, value, Widget? child) {
              return Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/card_games/seasons_card_game/down background.png')
                      )
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 85),
                      child: Image(image: AssetImage('assets/images/card_games/seasons_card_game/up background.png')),
                    ),
                  ),

                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 85),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Image(image: AssetImage('assets/images/card_games/seasons_card_game/exit.png'))),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            textToSpeech(seasonNames[data.currentSeason]);
                          },
                          child: Container(
                            width: 320,
                            height: 430,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF948A),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Container(
                                    width: 300,
                                    height: 303,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(24)
                                        )
                                    ),
                                    child: Image(image: AssetImage(seasonImages[data.currentSeason]),),
                                  ),
                                  const SizedBox(height: 30,),
                                  Text(seasonNames[data.currentSeason], style: GoogleFonts.comfortaa(
                                      textStyle: const TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold
                                      )
                                  ),)
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  if(data.currentSeason != 0){
                                    setState(() {
                                      data.currentSeason -=1;
                                    });
                                  }
                                },
                                child: const Image(image: AssetImage('assets/images/card_games/seasons_card_game/back.png'))
                            ),
                            const SizedBox(width: 30,),
                            InkWell(
                                onTap: () {
                                  if(data.currentSeason < seasonNames.length-1) {
                                    setState(() {
                                      data.currentSeason += 1;
                                    });
                                  }
                                },
                                child: const Image(image: AssetImage('assets/images/card_games/seasons_card_game/next.png'))
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
        ),
      ),
    );
  }
}
