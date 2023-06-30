import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/card_games/emotions_card_game/data/emotions.dart';
import 'package:bootcamp_f32/features/app/card_games/professions_card_game/data/professions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'services/services.dart';

class ProfessionsCardGame extends ConsumerStatefulWidget {
  const ProfessionsCardGame({super.key});

  @override
  ConsumerState<ProfessionsCardGame> createState() => _ProfessionCardGameState();
}

class _ProfessionCardGameState extends ConsumerState<ProfessionsCardGame> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(professionCardGameDataServiceProvider);
    final ValueNotifier<int> chooseProfession = ValueNotifier<int>(data.currentProfession);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFE6C7),
        body: ValueListenableBuilder(
            valueListenable: chooseProfession,
            builder: (BuildContext context, value, Widget? child) {
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/card_games/professions_image_game/ana sayfa 31.png'),
                    fit: BoxFit.fill
                  )
                ),
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: Image(image: AssetImage('assets/images/card_games/professions_image_game/down background.png'),),
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
                                    child: const Image(image: AssetImage('assets/images/card_games/professions_image_game/exit.png'))),
                              ),
                            ],
                          ),

                          InkWell(
                            onTap: () {
                              textToSpeech(professionNames[data.currentProfession]);
                            },
                            child: Container(
                              width: 320,
                              height: 430,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF948A),
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
                                      child: Image(image: AssetImage(professionImages[data.currentProfession]),),
                                    ),
                                    const SizedBox(height: 30,),
                                    Text(professionNames[data.currentProfession], style: GoogleFonts.comfortaa(
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
                                    if(data.currentProfession != 0){
                                      setState(() {
                                        data.currentProfession -=1;
                                      });
                                    }
                                  },
                                  child: const Image(image: AssetImage('assets/images/card_games/professions_image_game/back.png'))
                              ),
                              const SizedBox(width: 30,),
                              InkWell(
                                  onTap: () {
                                    if(data.currentProfession < professionNames.length-1) {
                                      setState(() {
                                        data.currentProfession += 1;
                                      });
                                    }
                                  },
                                  child: const Image(image: AssetImage('assets/images/card_games/professions_image_game/next.png'))
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
