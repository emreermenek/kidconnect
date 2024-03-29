// ignore_for_file: file_names

import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import '../data/seeAndDoNames_data.dart';
import '../services/seeAndDo_game_services.dart';

class DoTogetherSeeAndDoGame extends ConsumerStatefulWidget {
  const DoTogetherSeeAndDoGame({super.key});

  @override
  ConsumerState<DoTogetherSeeAndDoGame> createState() =>
      _DoTogetherSeeAndDoGameState();
}

class _DoTogetherSeeAndDoGameState
    extends ConsumerState<DoTogetherSeeAndDoGame> {
  final _player = AudioPlayer();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(seeAndDoGameServiceProvider);
    final ValueNotifier<int> chooseCard = ValueNotifier<int>(data.currentCard);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFBDF2D5),
        body: ValueListenableBuilder(
          valueListenable: chooseCard,
          builder: (BuildContext context, value, Widget? child) => SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                const Positioned.fill(
                  child: Image(
                      image: AssetImage(
                          'assets/images/do_together_images/background/background.png'),
                      fit: BoxFit.cover),
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
                              child: const Image(
                                  image: AssetImage(
                                      'assets/images/card_games/animal_card_game_image/exit.png'))),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    textToSpeech(
                                        seeAndDoNames[data.currentCard]);
                                  },
                                  child: Container(
                                    width: 320,
                                    height: 510,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF526D82),
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 300,
                                            height: 350,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            24))),
                                            child: Image(
                                              image: AssetImage(seeAndDoImages[
                                                  data.currentCard]),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 35),
                                            child: Text(
                                              seeAndDoNames[data.currentCard],
                                              style: GoogleFonts.comfortaa(
                                                  textStyle: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
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
                                          if (data.currentCard != 0) {
                                            setState(() {
                                              data.currentCard -= 1;
                                            });
                                          }
                                        },
                                        child: const Image(
                                            image: AssetImage(
                                                'assets/images/card_games/animal_card_game_image/back.png'))),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (data.currentCard <
                                              seeAndDoNames.length - 1) {
                                            setState(() {
                                              data.currentCard += 1;
                                            });
                                          }
                                        },
                                        child: const Image(
                                            image: AssetImage(
                                                'assets/images/card_games/animal_card_game_image/next.png'))),
                                  ],
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
