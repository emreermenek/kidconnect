import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/pink_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/data/colors_data.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class BlackCardGame extends StatefulWidget {
  const BlackCardGame({super.key});

  @override
  State<BlackCardGame> createState() => _BlackCardGameState();
}

class _BlackCardGameState extends State<BlackCardGame> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: GestureDetector(
            onPanUpdate: (details) {
              // Swiping in right direction.
              if (details.delta.dx > 0) {
                Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: const PinkCardGame()));
              }
            },
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Image(image: AssetImage('assets/images/card_games/color_card_game/siyah_sol_ust.png'),),
                ),
                const Positioned(
                  right: 0,
                  top: 120,
                  child: Image(image: AssetImage('assets/images/card_games/color_card_game/siyah_sag.png'),),
                ),
                const Positioned(
                  right: 0,
                  top: 350,
                  child: Image(image: AssetImage('assets/images/card_games/color_card_game/siyah çatlak.png'),),
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Image(image: AssetImage('assets/images/card_games/color_card_game/siyah_sol_alt.png'),),
                ),

                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Image(image: AssetImage('assets/images/card_games/color_card_game/siyah exit.png'))),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Center(
                        child: InkWell(
                            onTap: () {
                              textToSpeech(black[0]);
                            },
                            child: const Image(image: AssetImage('assets/images/card_games/color_card_game/siyah kart.png'),)),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        height: 500,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 70,),
                                InkWell(
                                  onTap: () {
                                    textToSpeech(black[1]);
                                  },
                                  child: const Image(image: AssetImage('assets/images/card_games/color_card_game/siyah bilgisyar.png'),),
                                ),
                                const SizedBox(height: 30,),
                                InkWell(
                                  onTap: () {
                                    textToSpeech(black[2]);
                                  },
                                  child: const Image(image: AssetImage('assets/images/card_games/color_card_game/siyah zebra.png'),),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20,),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    textToSpeech(black[3]);
                                  },
                                  child: const Image(image: AssetImage('assets/images/card_games/color_card_game/siyah kedi.png'),),
                                ),
                                const SizedBox(height: 10,),
                                InkWell(
                                  onTap: () {
                                    textToSpeech(black[4]);
                                  },
                                  child: const Image(image: AssetImage('assets/images/card_games/color_card_game/siyah gül.png'),),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
