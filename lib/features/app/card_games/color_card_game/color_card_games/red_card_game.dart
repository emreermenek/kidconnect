import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/yellow_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/data/colors_data.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'blue_card_game.dart';

class RedCardGame extends StatefulWidget {
  const RedCardGame({super.key});

  @override
  State<RedCardGame> createState() => _RedCardGameState();
}

class _RedCardGameState extends State<RedCardGame> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: GestureDetector(
            onPanUpdate: (details) {
              // Swiping in right direction.
              if (details.delta.dx > 0) {
                Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: const YellowCardGame()));
              }
              // Swiping in left direction.
              if (details.delta.dx < 0) {
                Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: const BlueCardGame()));
              }
            },
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Image(image: AssetImage('assets/images/card_games/color_card_game/kırmızı_sol_ust.png'),),
                ),
                const Positioned(
                  right: 0,
                  top: 120,
                  child: Image(image: AssetImage('assets/images/card_games/color_card_game/kırmızı_sag.png'),),
                ),
                const Positioned(
                  right: 0,
                  top: 350,
                  child: Image(image: AssetImage('assets/images/card_games/color_card_game/kırmızı çatlak.png'),),
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Image(image: AssetImage('assets/images/card_games/color_card_game/kırmızı_sol_alt.png'),),
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
                              child: const Image(image: AssetImage('assets/images/card_games/color_card_game/kırmızı exit.png'))),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Center(
                        child: InkWell(
                            onTap: () {
                              textToSpeech(red[0]);
                            },
                            child: const Image(image: AssetImage('assets/images/card_games/color_card_game/kırmızı kart.png'),)),
                      ),
                      const SizedBox(height: 2,),
                      Center(
                        child: InkWell(
                            onTap: () {
                              textToSpeech(red[1]);
                            },
                            child: const Image(image: AssetImage('assets/images/card_games/color_card_game/Türk Bayrağı.png'),)),
                      ),
                      const SizedBox(height: 10,),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                textToSpeech(red[2]);
                              },
                              child: const Image(image: AssetImage('assets/images/card_games/color_card_game/kırmızı çilek.png'))),
                          const SizedBox(width: 10,),
                          Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    textToSpeech(red[3]);
                                  },
                                  child: const Image(image: AssetImage('assets/images/card_games/color_card_game/kırmızı elma.png'))),
                              const SizedBox(height: 10,),
                              InkWell(
                                  onTap: () {
                                    textToSpeech(red[4]);
                                  },
                                  child: const Image(image: AssetImage('assets/images/card_games/color_card_game/kırmızı boya.png'))),
                            ],
                          )
                        ],
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
