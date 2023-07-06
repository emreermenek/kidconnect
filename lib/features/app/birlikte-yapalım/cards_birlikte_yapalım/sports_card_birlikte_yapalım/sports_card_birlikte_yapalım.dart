import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/birlikte-yapal%C4%B1m/cards_birlikte_yapal%C4%B1m/services/services.dart';
import 'package:bootcamp_f32/features/app/birlikte-yapal%C4%B1m/cards_birlikte_yapal%C4%B1m/sports_card_birlikte_yapal%C4%B1m/services/services.dart';
import 'package:bootcamp_f32/features/app/card_games/animal_card_game/data/animals.dart';
import 'package:bootcamp_f32/features/app/card_games/animal_card_game/services/services.dart';
import 'package:bootcamp_f32/features/app/card_games/letter_game/data/backgroundColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import 'data/data_sports_birlikte_yapalım.dart';

class SportsBirlikteYapalimCard extends ConsumerStatefulWidget {
  const SportsBirlikteYapalimCard({super.key});

  @override
  ConsumerState<SportsBirlikteYapalimCard> createState() =>
      _SportsBirlikteYapalimCardState();
}

class _SportsBirlikteYapalimCardState
    extends ConsumerState<SportsBirlikteYapalimCard> {
  final _player = AudioPlayer();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(SportsBirlikteYapalimDataServiceProvider);
    final ValueNotifier<int> chooseCard =
        ValueNotifier<int>(data.sportsCurrentCard);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ValueListenableBuilder(
          valueListenable: chooseCard,
          builder: (BuildContext context, value, Widget? child) => SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image(
                      image: AssetImage(
                          'assets/images/do_together_images/background/background.png'),
                      fit: BoxFit.cover),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 85),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Image(
                                    image: AssetImage(
                                        'assets/images/card_games/animal_card_game_image/exit.png'))),
                          ),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 127),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    textToSpeech(
                                        sportsNames[data.sportsCurrentCard]);
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
                                                color: Color(0xFFDDE6ED),
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            24))),
                                            child: Image(
                                              image: AssetImage(sportsImages[
                                                  data.sportsCurrentCard]),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            sportsNames[data.sportsCurrentCard],
                                            style: GoogleFonts.comfortaa(
                                                textStyle: const TextStyle(
                                                    fontSize: 28,
                                                    fontWeight:
                                                        FontWeight.bold)),
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
                                          if (data.sportsCurrentCard != 0) {
                                            setState(() {
                                              data.sportsCurrentCard -= 1;
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
                                          if (data.sportsCurrentCard <
                                              sportsNames.length - 1) {
                                            setState(() {
                                              data.sportsCurrentCard += 1;
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
