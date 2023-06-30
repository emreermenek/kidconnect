import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/red_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/data/colors_data.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class YellowCardGame extends StatefulWidget {
  const YellowCardGame({super.key});

  @override
  State<YellowCardGame> createState() => _YellowCardGameState();
}

class _YellowCardGameState extends State<YellowCardGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onPanUpdate: (details) {
          // Swiping in left direction.
          if (details.delta.dx < 0) {
            Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: const RedCardGame()));
          }
        },
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Image(image: AssetImage('assets/images/card_games/color_card_game/sarı_sol_ust_yıldız.png'),),
            ),
            const Positioned(
              right: 0,
              top: 120,
              child: Image(image: AssetImage('assets/images/card_games/color_card_game/sarı_sag_yıldız.png'),),
            ),
            const Positioned(
              right: 0,
              top: 350,
              child: Image(image: AssetImage('assets/images/card_games/color_card_game/sarı çatlak.png'),),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Image(image: AssetImage('assets/images/card_games/color_card_game/sarı_sol yıldız.png'),),
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
                          child: const Image(image: AssetImage('assets/images/card_games/color_card_game/sarı exit.png'))),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Center(
                    child: InkWell(
                      onTap: () {
                        textToSpeech(yellow[0]);
                      },
                        child: const Image(image: AssetImage('assets/images/card_games/color_card_game/sarı kart.png'),)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          textToSpeech(yellow[1]);
                        },
                          child: const Image(image: AssetImage('assets/images/card_games/color_card_game/sarı civciv.png'))),
                      Column(
                        children: [
                          const SizedBox(height: 60,),
                          InkWell(
                              onTap: () {
                                textToSpeech(yellow[2]);
                              },
                              child: const Image(image: AssetImage('assets/images/card_games/color_card_game/sarı çanta.png'))),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            textToSpeech(yellow[3]);
                          },
                          child: const Image(image: AssetImage('assets/images/card_games/color_card_game/sarı muz.png'))),
                      const SizedBox(width: 30,),
                      InkWell(
                          onTap: () {
                            textToSpeech(yellow[4]);
                          },
                          child: const Image(image: AssetImage('assets/images/card_games/color_card_game/sarı tişört.png'))),
                    ],
                  ),
                  Positioned(
                    right: 150,
                    bottom: 0,
                    child: InkWell(
                        onTap: () {
                          textToSpeech(yellow[5]);
                        },
                        child: const Image(image: AssetImage('assets/images/card_games/color_card_game/sarı ayakkabı.png'),)),
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
