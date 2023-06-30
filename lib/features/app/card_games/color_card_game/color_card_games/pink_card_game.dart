import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/black_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/brown_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/data/colors_data.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PinkCardGame extends StatefulWidget {
  const PinkCardGame({super.key});

  @override
  State<PinkCardGame> createState() => _PinkCardGameState();
}

class _PinkCardGameState extends State<PinkCardGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onPanUpdate: (details) {
            // Swiping in right direction.
            if (details.delta.dx > 0) {
              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: const BrownCardGame()));
            }
            // Swiping in left direction.
            if (details.delta.dx < 0) {
              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: const BlackCardGame()));
            }
          },
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Image(image: AssetImage('assets/images/card_games/color_card_game/pembe_sol_ust.png'),),
              ),
              const Positioned(
                right: 0,
                top: 120,
                child: Image(image: AssetImage('assets/images/card_games/color_card_game/pembe_sag.png'),),
              ),
              const Positioned(
                right: 0,
                top: 350,
                child: Image(image: AssetImage('assets/images/card_games/color_card_game/pembe çatlak.png'),),
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Image(image: AssetImage('assets/images/card_games/color_card_game/pembe_sag_alt.png'),),
              ),

              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Image(image: AssetImage('assets/images/card_games/color_card_game/pembe exit.png'))),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Center(
                      child: InkWell(
                          onTap: () {
                            textToSpeech(pink[0]);
                          },
                          child: const Image(image: AssetImage('assets/images/card_games/color_card_game/pembe kart.png'),)),
                    ),
                    const SizedBox(height: 10,),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 500,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    textToSpeech(pink[1]);
                                  },
                                  child: const Image(image: AssetImage('assets/images/card_games/color_card_game/pembe dondurma.png'),width: 120,),
                                ),
                                InkWell(
                                  onTap: () {
                                    textToSpeech(pink[2]);
                                  },
                                  child: const Image(image: AssetImage('assets/images/card_games/color_card_game/pembe ahududu.png'),width: 120,),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                const SizedBox(height: 60,),
                                InkWell(
                                  onTap: () {
                                    textToSpeech(pink[3]);
                                  },
                                  child: const Image(image: AssetImage('assets/images/card_games/color_card_game/pembe flamingo.png'),width: 120,),
                                ),
                                const SizedBox(height: 10,),
                                InkWell(
                                  onTap: () {
                                    textToSpeech(pink[4]);
                                  },
                                  child: const Image(image: AssetImage('assets/images/card_games/color_card_game/pembe dondurma 2.png'),width: 120,),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    textToSpeech(pink[5]);
                                  },
                                  child: const Image(image: AssetImage('assets/images/card_games/color_card_game/pembe kulaklık.png'),width: 120,),
                                ),
                                const SizedBox(height: 10,),
                                InkWell(
                                  onTap: () {
                                    textToSpeech(pink[6]);
                                  },
                                  child: const Image(image: AssetImage('assets/images/card_games/color_card_game/pembe çiçek.png'),width: 120,),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
