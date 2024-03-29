import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/make_word_game/levels/make_word_game_level_9.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class MakeWordGameLevel10 extends ConsumerStatefulWidget {
  const MakeWordGameLevel10({super.key});

  @override
  ConsumerState<MakeWordGameLevel10> createState() =>
      _MakeWordGameLevel10State();
}

class _MakeWordGameLevel10State extends ConsumerState<MakeWordGameLevel10> {
  final _player = AudioPlayer();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                            image: AssetImage(
                                'assets/images/make_word_game_images/background.png'),
                            fit: BoxFit.fill)),
                  )),
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
                              child: const Image(
                                  image: AssetImage(
                                      'assets/images/make_word_game_images/exit.png'))),
                          const Image(
                              image: AssetImage(
                                  'assets/images/image_match/background/kolay.png')),
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
                                    offset: const Offset(4, 5))
                              ],
                              border: Border.all(
                                  color: const Color(0xFFF07E74), width: 6)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'k',
                                    style: GoogleFonts.comfortaa(
                                        textStyle: const TextStyle(
                                            fontSize: 80,
                                            color: Color(0xFF16519F))),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        textToSpeech('ayı');
                                      },
                                      child: const Image(
                                          image: AssetImage(
                                              'assets/images/make_word_game_images/ayı.png'))),
                                  Text(
                                    'k',
                                    style: GoogleFonts.comfortaa(
                                        textStyle: const TextStyle(
                                            fontSize: 80,
                                            color: Color(0xFF16519F))),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                width: 206,
                                height: 79,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(32),
                                    border: Border.all(
                                        color: const Color(0xFF16519F),
                                        width: 6)),
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  maxLength: 5,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 24),
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2.0, color: Colors.black)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2.0, color: Colors.black)),
                                    counterText: "",
                                  ),
                                  onChanged: (value) {
                                    if (value.toLowerCase() == 'kayık') {
                                      Navigator.of(context).pop();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) =>
                                      const MakeWordGameLevel9(),
                                ));
                              },
                              child: const Image(
                                image: AssetImage(
                                    'assets/images/make_word_game_images/back.png'),
                              ),
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
      ),
    );
  }
}
