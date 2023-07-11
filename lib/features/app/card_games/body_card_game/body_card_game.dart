import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/card_games/body_card_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import 'data/body.dart';

class BodyCardGame extends ConsumerStatefulWidget {
  const BodyCardGame({super.key});

  @override
  ConsumerState<BodyCardGame> createState() => _BodyCardGameState();
}

class _BodyCardGameState extends ConsumerState<BodyCardGame> {
  final _player = AudioPlayer();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(bodyCardGameDataServiceProvider);
    final ValueNotifier<int> chooseBody = ValueNotifier<int>(data.currentBody);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ValueListenableBuilder(
          valueListenable: chooseBody,
          builder: (BuildContext context, value, Widget? child) => SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.topRight,
                  child: Image(image: AssetImage('assets/images/card_games/body_card_game/up background.png'),),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Image(image: AssetImage('assets/images/card_games/body_card_game/down background.png'),),
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
                              child: const Image(image: AssetImage('assets/images/card_games/body_card_game/exit.png'))),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    textToSpeech(bodyNames[data.currentBody]);
                                  },
                                  child: Container(
                                    width: 320,
                                    height: 430,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF5F8D4E),
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
                                                color: Color(0xFFE5D9B6),
                                                borderRadius: BorderRadius.vertical(
                                                    top: Radius.circular(24)
                                                )
                                            ),
                                            child: Image(image: AssetImage(bodyImages[data.currentBody]),),
                                          ),
                                          const SizedBox(height: 30,),
                                          Text(bodyNames[data.currentBody], style: GoogleFonts.comfortaa(
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
                                          if(data.currentBody != 0){
                                            setState(() {
                                              data.currentBody -=1;
                                            });
                                          }
                                        },
                                        child: const Image(image: AssetImage('assets/images/card_games/body_card_game/back.png'))
                                    ),
                                    const SizedBox(width: 30,),
                                    InkWell(
                                        onTap: () {
                                          if(data.currentBody < bodyNames.length-1) {
                                            setState(() {
                                              data.currentBody += 1;
                                            });
                                          }
                                        },
                                        child: const Image(image: AssetImage('assets/images/card_games/body_card_game/next.png'))
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                      )
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
