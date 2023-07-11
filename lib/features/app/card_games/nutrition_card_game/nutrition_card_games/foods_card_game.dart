import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/card_games/nutrition_card_game/data/foods.dart';
import 'package:bootcamp_f32/features/app/card_games/nutrition_card_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodsCardGame extends ConsumerStatefulWidget {
  const FoodsCardGame({super.key});

  @override
  ConsumerState<FoodsCardGame> createState() => _FoodsCardGameState();
}

class _FoodsCardGameState extends ConsumerState<FoodsCardGame> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(nutritionCardGameDataServiceProvider);
    final ValueNotifier<int> chooseFood = ValueNotifier<int>(data.currentFoods);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ValueListenableBuilder(
            valueListenable: chooseFood,
            builder: (BuildContext context, value, Widget? child) {
              return Stack(
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Image(image: AssetImage('assets/images/card_games/nutrition_card_game/background/top_right_b.png'),),
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Image(image: AssetImage('assets/images/card_games/nutrition_card_game/background/bottom_right_b.png'),),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Image(image: AssetImage('assets/images/card_games/nutrition_card_game/background/bottom_center_b.png'),),
                  ),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Image(image: AssetImage('assets/images/card_games/nutrition_card_game/background/bottom_left_b.png'),),
                  ),
                  const Positioned(
                    right: 0,
                    bottom: 60,
                    child: Image(image: AssetImage('assets/images/card_games/nutrition_card_game/background/b30_right_b.png'),),
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
                                child: const Image(image: AssetImage('assets/images/card_games/nutrition_card_game/background/exit.png'))),
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            textToSpeech(foodNames[data.currentFoods]);
                          },
                          child: Container(
                            width: 320,
                            height: 430,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF6000),
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
                                        color: Color(0xFFFFE6C7),
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(24)
                                        )
                                    ),
                                    child: Image(image: AssetImage(foodImages[data.currentFoods]),),
                                  ),
                                  const SizedBox(height: 30,),
                                  Text(foodNames[data.currentFoods], style: GoogleFonts.comfortaa(
                                      textStyle: const TextStyle(
                                          fontSize: 20,
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
                                  if(data.currentFoods != 0){
                                    setState(() {
                                      data.currentFoods -=1;
                                    });
                                  }
                                },
                                child: const Image(image: AssetImage('assets/images/card_games/nutrition_card_game/background/back.png'))
                            ),
                            const SizedBox(width: 30,),
                            InkWell(
                                onTap: () {
                                  if(data.currentFoods < foodNames.length-1) {
                                    setState(() {
                                      data.currentFoods += 1;
                                    });
                                  }
                                },
                                child: const Image(image: AssetImage('assets/images/card_games/nutrition_card_game/background/next.png'))
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
