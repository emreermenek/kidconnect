import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/green_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/red_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/data/colors_data.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class BlueCardGame extends StatefulWidget {
  const BlueCardGame({super.key});

  @override
  State<BlueCardGame> createState() => _BlueCardGameState();
}

class _BlueCardGameState extends State<BlueCardGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onPanUpdate: (details) {
            // Swiping in right direction.
            if (details.delta.dx > 0) {
              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: const RedCardGame()));
            }
            // Swiping in left direction.
            if (details.delta.dx < 0) {
              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: const GreenCardGame()));
            }
          },
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Image(image: AssetImage('assets/images/card_games/color_card_game/mavi_sol_ust.png'),),
              ),
              const Positioned(
                right: 0,
                top: 120,
                child: Image(image: AssetImage('assets/images/card_games/color_card_game/mavi_sag.png'),),
              ),
              const Positioned(
                right: 0,
                top: 350,
                child: Image(image: AssetImage('assets/images/card_games/color_card_game/mavi çatlak.png'),),
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Image(image: AssetImage('assets/images/card_games/color_card_game/mavi_sol_alt.png'),),
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
                            child: const Image(image: AssetImage('assets/images/card_games/color_card_game/mavi exit.png'))),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Center(
                      child: InkWell(
                          onTap: () {
                            textToSpeech(blue[0]);
                          },
                          child: const Image(image: AssetImage('assets/images/card_games/color_card_game/mavi kart.png'),)),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              textToSpeech(blue[1]);
                            },
                            child: const Image(image: AssetImage('assets/images/card_games/color_card_game/mavi kuş.png'))),
                        const SizedBox(width: 30,),
                        InkWell(
                            onTap: () {
                              textToSpeech(blue[2]);
                            },
                            child: const Image(image: AssetImage('assets/images/card_games/color_card_game/mavi pantolon.png'))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              textToSpeech(blue[3]);
                            },
                            child: const Image(image: AssetImage('assets/images/card_games/color_card_game/mavi balina.png'))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              textToSpeech(blue[4]);
                            },
                            child: const Image(image: AssetImage('assets/images/card_games/color_card_game/mavi denizkabuğu.png'))),
                        const SizedBox(width: 30,),
                        InkWell(
                            onTap: () {
                              textToSpeech(blue[5]);
                            },
                            child: const Image(image: AssetImage('assets/images/card_games/color_card_game/mavi dünya.png'))),
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
