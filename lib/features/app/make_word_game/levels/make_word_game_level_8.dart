import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/make_word_game/levels/make_word_game_level_4.dart';
import 'package:bootcamp_f32/features/app/make_word_game/levels/make_word_game_level_7.dart';
import 'package:bootcamp_f32/features/app/make_word_game/levels/make_word_game_level_9.dart';
import 'package:bootcamp_f32/features/app/make_word_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'make_word_game_level_1.dart';
import 'make_word_game_level_2.dart';
import 'make_word_game_level_5.dart';
import 'make_word_game_level_6.dart';

class MakeWordGameLevel8 extends ConsumerStatefulWidget {
  const MakeWordGameLevel8({super.key});

  @override
  ConsumerState<MakeWordGameLevel8> createState() => _MakeWordGameLevel8State();
}

class _MakeWordGameLevel8State extends ConsumerState<MakeWordGameLevel8> {

  final _player = AudioPlayer();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(makeWordGameServiceProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/make_word_game_images/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                )
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Image(image: AssetImage('assets/images/make_word_game_images/exit.png'))),
                        const Image(image: AssetImage( 'assets/images/image_match/background/orta.png')),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 310,
                        height: 450,
                        decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(32),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  offset: const Offset(
                                      4,
                                      5
                                  )
                              )
                            ],
                            border: Border.all(
                                color: const Color(0xFFF07E74),
                                width: 6
                            )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {
                                      textToSpeech('bal');
                                    },
                                    child: const Image(image: AssetImage('assets/images/make_word_game_images/bal.png'))),
                                Text('k', style: GoogleFonts.comfortaa(
                                    textStyle: const TextStyle(
                                        fontSize: 80,
                                        color: Color(0xFF16519F)
                                    )
                                ),),
                                InkWell(
                                    onTap: () {
                                      textToSpeech('on');
                                    },
                                    child: const Image(image: AssetImage('assets/images/make_word_game_images/on.png'))),
                              ],
                            ),
                            const SizedBox(height: 30,),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              width: 206,
                              height: 79,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(32),
                                  border: Border.all(
                                      color: const Color(0xFF16519F),
                                      width: 6
                                  )
                              ),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                maxLength: 6,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 24
                                ),
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2.0,
                                          color: Colors.black
                                      )
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2.0,
                                          color: Colors.black
                                      )
                                  ),
                                  counterText: "",
                                ),
                                onChanged: (value) {
                                  if(value.toLowerCase() == 'balkon'){
                                    _player.setAsset(
                                        'assets/sounds/correct_answer.mp3'
                                    );
                                    _player.play();
                                    data.levelLock(8);
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MakeWordGameLevel9(),));
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MakeWordGameLevel7(),));
                            },
                            child: const Image(image: AssetImage('assets/images/make_word_game_images/back.png'),),
                          ),
                          const SizedBox(width: 30,),
                          InkWell(
                            onTap: () {
                              if(data.lock[8] == 'assets/images/level_list/open_lock.png'){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MakeWordGameLevel9(),));
                              }
                            },
                            child: const Image(image: AssetImage('assets/images/make_word_game_images/next.png'),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
