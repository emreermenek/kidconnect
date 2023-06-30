import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/pink_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/purple_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/data/colors_data.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class BrownCardGame extends StatefulWidget {
  const BrownCardGame({super.key});

  @override
  State<BrownCardGame> createState() => _BrownCardGameState();
}

class _BrownCardGameState extends State<BrownCardGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onPanUpdate: (details) {
            // Swiping in right direction.
            if (details.delta.dx > 0) {
              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: const PurpleCardGame()));
            }
            // Swiping in left direction.
            if (details.delta.dx < 0) {
              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: const PinkCardGame()));
            }
          },
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Image(image: AssetImage('assets/images/card_games/color_card_game/kahverengi_sol_ust.png'),),
              ),
              const Positioned(
                right: 0,
                top: 120,
                child: Image(image: AssetImage('assets/images/card_games/color_card_game/kahverengi_sag.png'),),
              ),
              const Positioned(
                right: 0,
                top: 350,
                child: Image(image: AssetImage('assets/images/card_games/color_card_game/kahverengi çatlak.png'),),
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Image(image: AssetImage('assets/images/card_games/color_card_game/kahverengi_ sol_alt.png'),),
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
                            child: const Image(image: AssetImage('assets/images/card_games/color_card_game/kahverengi exit.png'))),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Center(
                      child: InkWell(
                          onTap: () {
                            textToSpeech(brown[0]);
                          },
                          child: const Image(image: AssetImage('assets/images/card_games/color_card_game/kahverengi kart.png'),)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                textToSpeech(brown[1]);
                              },
                              child: const Image(image: AssetImage('assets/images/card_games/color_card_game/kahverengi fındık.png')),
                            ),
                            const SizedBox(height: 10,),
                            InkWell(
                              onTap: () {
                                textToSpeech(brown[2]);
                              },
                              child: const Image(image: AssetImage('assets/images/card_games/color_card_game/kahverengi çanta.png')),
                            ),
                            const SizedBox(height: 10,),
                            InkWell(
                              onTap: () {
                                textToSpeech(brown[3]);
                              },
                              child: const Image(image: AssetImage('assets/images/card_games/color_card_game/kahverengi badem.png')),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          children: [
                              InkWell(
                                onTap: () {
                                  textToSpeech(brown[4]);
                                },
                                child: const Image(image: AssetImage('assets/images/card_games/color_card_game/kahverengi sincap.png')),
                              ),
                              const SizedBox(height: 10,),
                              InkWell(
                                onTap: () {
                                  textToSpeech(brown[5]);
                                },
                                child: const Image(image: AssetImage('assets/images/card_games/color_card_game/kahverengi ceviz.png')),
                              )
                          ],
                        ),
                      ],
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
