import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/green_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/purple_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/data/colors_data.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class OrangeCardGame extends StatefulWidget {
  const OrangeCardGame({super.key});

  @override
  State<OrangeCardGame> createState() => _OrangeCardGameState();
}

class _OrangeCardGameState extends State<OrangeCardGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onPanUpdate: (details) {
            // Swiping in right direction.
            if (details.delta.dx > 0) {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRightWithFade,
                      child: const GreenCardGame()));
            }
            // Swiping in left direction.
            if (details.delta.dx < 0) {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      child: const PurpleCardGame()));
            }
          },
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Image(
                  image: AssetImage(
                      'assets/images/card_games/color_card_game/turuncu_sol_ust.png'),
                ),
              ),
              const Positioned(
                right: 0,
                top: 120,
                child: Image(
                  image: AssetImage(
                      'assets/images/card_games/color_card_game/turuncu_sag.png'),
                ),
              ),
              const Positioned(
                right: 0,
                top: 350,
                child: Image(
                  image: AssetImage(
                      'assets/images/card_games/color_card_game/turuncu çatlak.png'),
                ),
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Image(
                  image: AssetImage(
                      'assets/images/card_games/color_card_game/turuncu_sol_alt.png'),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Image(
                                image: AssetImage(
                                    'assets/images/card_games/color_card_game/turuncu exit.png'))),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: InkWell(
                          onTap: () {
                            textToSpeech(orange[0]);
                          },
                          child: const Image(
                            image: AssetImage(
                                'assets/images/card_games/color_card_game/turuncu kart.png'),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              textToSpeech(orange[1]);
                            },
                            child: const Image(
                                image: AssetImage(
                                    'assets/images/card_games/color_card_game/turuncu portakal.png'))),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              textToSpeech(orange[2]);
                            },
                            child: const Image(
                                image: AssetImage(
                                    'assets/images/card_games/color_card_game/turuncu gözlük.png'))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              textToSpeech(orange[3]);
                            },
                            child: const Image(
                                image: AssetImage(
                                    'assets/images/card_games/color_card_game/turuncu kıyafet.png'))),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              textToSpeech(orange[4]);
                            },
                            child: const Image(
                                image: AssetImage(
                                    'assets/images/card_games/color_card_game/turuncu araba.png'))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              textToSpeech(orange[5]);
                            },
                            child: const Image(
                                image: AssetImage(
                                    'assets/images/card_games/color_card_game/turuncu bisiklet.png'))),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              textToSpeech(orange[6]);
                            },
                            child: const Image(
                                image: AssetImage(
                                    'assets/images/card_games/color_card_game/turuncu mandalina.png'))),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
