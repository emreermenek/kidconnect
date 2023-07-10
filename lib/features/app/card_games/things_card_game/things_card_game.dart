import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/card_games/things_card_game/data/things.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'services/services.dart';

class ThingsCardGame extends ConsumerStatefulWidget {
  const ThingsCardGame({super.key});

  @override
  ConsumerState<ThingsCardGame> createState() => _ThingsCardGameState();
}

class _ThingsCardGameState extends ConsumerState<ThingsCardGame> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(thingsCardGameDataServiceProvider);
    final ValueNotifier<int> chooseThing = ValueNotifier<int>(data.currentThing);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF07E74),
        body: ValueListenableBuilder(
            valueListenable: chooseThing,
            builder: (BuildContext context, value, Widget? child) {
              return Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/card_games/things_card_game/background_top.png')
                      )
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.bottomCenter,
                            fit: BoxFit.fitWidth,
                            image: AssetImage('assets/images/card_games/things_card_game/background_bottom.png')
                        )
                    ),
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
                                  child: const Image(image: AssetImage('assets/images/card_games/things_card_game/exit.png'))),
                            ),
                          ],
                        ),

                        InkWell(
                          onTap: () {
                            textToSpeech(thingNames[data.currentThing]);
                          },
                          child: Container(
                            width: 320,
                            height: 430,
                            decoration: BoxDecoration(
                              color: const Color(0xFF16519F),
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
                                        color: Color(0xFFE8EAE3),
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(24)
                                        )
                                    ),
                                    child: Image(image: AssetImage(thingImages[data.currentThing]),),
                                  ),
                                  const SizedBox(height: 30,),
                                  Text(thingNames[data.currentThing], style: GoogleFonts.comfortaa(
                                      textStyle: const TextStyle(
                                          fontSize: 24,
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
                                  if(data.currentThing != 0){
                                    setState(() {
                                      data.currentThing -=1;
                                    });
                                  }
                                },
                                child: const Image(image: AssetImage('assets/images/card_games/things_card_game/back.png'))
                            ),
                            const SizedBox(width: 30,),
                            InkWell(
                                onTap: () {
                                  if(data.currentThing < thingNames.length-1) {
                                    setState(() {
                                      data.currentThing += 1;
                                    });
                                  }
                                },
                                child: const Image(image: AssetImage('assets/images/card_games/things_card_game/next.png'))
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
