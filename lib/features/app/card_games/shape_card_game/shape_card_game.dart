import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/card_games/shape_card_game/data/shapes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'services/services.dart';

class ShapeCardGame extends ConsumerStatefulWidget {
  const ShapeCardGame({super.key});

  @override
  ConsumerState<ShapeCardGame> createState() => _ShapeCardGameState();
}

class _ShapeCardGameState extends ConsumerState<ShapeCardGame> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(shapeCardGameDataServiceProvider);
    final ValueNotifier<int> chooseShape = ValueNotifier<int>(data.currentShape);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ValueListenableBuilder(
            valueListenable: chooseShape,
            builder: (BuildContext context, value, Widget? child) {
              return Stack(
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Image(image: AssetImage('assets/images/card_games/shapes_card_game/up_background.png'),),
                  ),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Image(image: AssetImage('assets/images/card_games/shapes_card_game/down_left_background.png'),),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Image(image: AssetImage('assets/images/card_games/shapes_card_game/down_center_background.png'),),
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Image(image: AssetImage('assets/images/card_games/shapes_card_game/down_right_background.png'),),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Image(image: AssetImage('assets/images/card_games/seasons_card_game/exit.png'))),
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            textToSpeech(shapeNames[data.currentShape]);
                          },
                          child: Container(
                            width: 320,
                            height: 430,
                            decoration: BoxDecoration(
                              color: const Color(0xFFDF2E38),
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
                                        color: Color(0xFFDDF7E3),
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(24)
                                        )
                                    ),
                                    child: Image(image: AssetImage(shapeImages[data.currentShape]),),
                                  ),
                                  const SizedBox(height: 30,),
                                  Text(shapeNames[data.currentShape], style: GoogleFonts.comfortaa(
                                      textStyle: const TextStyle(
                                          fontSize: 30,
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
                                  if(data.currentShape != 0){
                                    setState(() {
                                      data.currentShape -=1;
                                    });
                                  }
                                },
                                child: const Image(image: AssetImage('assets/images/card_games/shapes_card_game/back.png'))
                            ),
                            const SizedBox(width: 30,),
                            InkWell(
                                onTap: () {
                                  if(data.currentShape < shapeNames.length-1) {
                                    setState(() {
                                      data.currentShape += 1;
                                    });
                                  }
                                },
                                child: const Image(image: AssetImage('assets/images/card_games/shapes_card_game/next.png'))
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
