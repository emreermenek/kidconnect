import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/brown_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/orange_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/data/colors_data.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PurpleCardGame extends StatefulWidget {
  const PurpleCardGame({super.key});

  @override
  State<PurpleCardGame> createState() => _PurpleCardGameState();
}

class _PurpleCardGameState extends State<PurpleCardGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onPanUpdate: (details) {
            // Swiping in right direction.
            if (details.delta.dx > 0) {
              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: const OrangeCardGame()));
            }
            // Swiping in left direction.
            if (details.delta.dx < 0) {
              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: const BrownCardGame()));
            }
          },
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Image(image: AssetImage('assets/images/card_games/color_card_game/mor_sol_ust.png'),),
              ),
              const Positioned(
                right: 0,
                top: 120,
                child: Image(image: AssetImage('assets/images/card_games/color_card_game/mor_sag.png'),),
              ),
              const Positioned(
                right: 0,
                top: 350,
                child: Image(image: AssetImage('assets/images/card_games/color_card_game/mor çatlak.png'),),
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Image(image: AssetImage('assets/images/card_games/color_card_game/mor_sol_alt.png'),),
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
                            child: const Image(image: AssetImage('assets/images/card_games/color_card_game/mor exit.png'))),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Center(
                      child: InkWell(
                          onTap: () {
                            textToSpeech(purple[0]);
                          },
                          child: const Image(image: AssetImage('assets/images/card_games/color_card_game/mor kart.png'),)),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: 180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 30,),
                              InkWell(
                                  onTap: () {
                                    textToSpeech(purple[1]);
                                  },
                                  child: const Image(image: AssetImage('assets/images/card_games/color_card_game/mor incir.png'))
                              )
                            ],
                          ),
                          InkWell(
                              onTap: () {
                                textToSpeech(purple[2]);
                              },
                              child: const Image(image: AssetImage('assets/images/card_games/color_card_game/mor kelebek.png'))
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: InkWell(
                          onTap: () {
                            textToSpeech(purple[3]);
                          },
                          child: const Image(image: AssetImage('assets/images/card_games/color_card_game/mor erik.png')))
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 10,),
                            InkWell(
                                onTap: () {
                                  textToSpeech(purple[4]);
                                },
                                child: const Image(image: AssetImage('assets/images/card_games/color_card_game/mor patlıcan.png'),width: 130,)
                            )
                          ],
                        ),
                        InkWell(
                            onTap: () {
                              textToSpeech(purple[5]);
                            },
                            child: const Image(image: AssetImage('assets/images/card_games/color_card_game/mor hipopotam.png'))
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
