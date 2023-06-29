import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/card_games/emotions_card_game/data/emotions.dart';
import 'package:bootcamp_f32/features/app/card_games/emotions_card_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class EmotionsCardGame extends ConsumerStatefulWidget {
  const EmotionsCardGame({super.key});

  @override
  ConsumerState<EmotionsCardGame> createState() => _EmotionsCardGameState();
}

class _EmotionsCardGameState extends ConsumerState<EmotionsCardGame> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(emotionCardGameDataServiceProvider);
    final ValueNotifier<int> chooseEmotion = ValueNotifier<int>(data.currentEmotion);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFE6C7),
        body: ValueListenableBuilder(
          valueListenable: chooseEmotion,
          builder: (BuildContext context, value, Widget? child) {
          return Stack(
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: Image(image: AssetImage('assets/images/card_games/emotions_card_game/background_top_right.png'),),
              ),
              const Align(
                alignment: Alignment.bottomRight,
                child: Image(image: AssetImage('assets/images/card_games/emotions_card_game/background_bottom_right.png'),),
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Image(image: AssetImage('assets/images/card_games/emotions_card_game/background_bottom_left.png'),),
              ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 85),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Image(image: AssetImage('assets/images/card_games/emotions_card_game/exit.png'))),
                          ),
                        ],
                      ),

                      InkWell(
                        onTap: () {
                          textToSpeech(emotionNames[data.currentEmotion]);
                        },
                        child: Container(
                          width: 320,
                          height: 430,
                          decoration: BoxDecoration(
                            color: const Color(0xFFDF7861),
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
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(24)
                                      )
                                  ),
                                  child: Image(image: AssetImage(emotionImages[data.currentEmotion]),),
                                ),
                                const SizedBox(height: 30,),
                                Text(emotionNames[data.currentEmotion], style: GoogleFonts.comfortaa(
                                    textStyle: const TextStyle(
                                        fontSize: 40,
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
                                if(data.currentEmotion != 0){
                                  setState(() {
                                    data.currentEmotion -=1;
                                  });
                                }
                              },
                              child: const Image(image: AssetImage('assets/images/card_games/emotions_card_game/back.png'))
                          ),
                          const SizedBox(width: 30,),
                          InkWell(
                              onTap: () {
                                if(data.currentEmotion < emotionNames.length-1) {
                                  setState(() {
                                    data.currentEmotion += 1;
                                  });
                                }
                              },
                              child: const Image(image: AssetImage('assets/images/card_games/emotions_card_game/next.png'))
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
