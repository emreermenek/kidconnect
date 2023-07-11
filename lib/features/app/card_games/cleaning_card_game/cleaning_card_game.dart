import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/card_games/cleaning_card_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/cleaning.dart';

class CleaningCardGame extends ConsumerStatefulWidget {
  const CleaningCardGame({super.key});

  @override
  ConsumerState<CleaningCardGame> createState() => _CleaningCardGameState();
}

class _CleaningCardGameState extends ConsumerState<CleaningCardGame> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(cleaningCardGameDataServiceProvider);
    final ValueNotifier<int> chooseCleaning =
        ValueNotifier<int>(data.currentCleaning);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFC7F4FF),
        body: ValueListenableBuilder(
            valueListenable: chooseCleaning,
            builder: (BuildContext context, value, Widget? child) {
              return Stack(
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage(
                          'assets/images/card_games/cleaning_image_game/all background.png'),
                    ),
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
                                child: const Image(image: AssetImage('assets/images/card_games/cleaning_image_game/exit.png'))),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            textToSpeech(cleaningNames[data.currentCleaning]);
                          },
                          child: Container(
                            width: 320,
                            height: 430,
                            decoration: BoxDecoration(
                              color: const Color(0xFF5881B7),
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
                                            top: Radius.circular(24))),
                                    child: Image(
                                      image: AssetImage(
                                          cleaningImages[data.currentCleaning]),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    cleaningNames[data.currentCleaning],
                                    style: GoogleFonts.comfortaa(
                                        textStyle: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  if (data.currentCleaning != 0) {
                                    setState(() {
                                      data.currentCleaning -= 1;
                                    });
                                  }
                                },
                                child: const Image(
                                    image: AssetImage(
                                        'assets/images/card_games/cleaning_image_game/back.png'))),
                            const SizedBox(
                              width: 30,
                            ),
                            InkWell(
                                onTap: () {
                                  if (data.currentCleaning <
                                      cleaningNames.length - 1) {
                                    setState(() {
                                      data.currentCleaning += 1;
                                    });
                                  }
                                },
                                child: const Image(
                                    image: AssetImage(
                                        'assets/images/card_games/cleaning_image_game/next.png'))),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
