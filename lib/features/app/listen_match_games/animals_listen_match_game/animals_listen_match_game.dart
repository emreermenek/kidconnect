import 'dart:math';

import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/listen_match_games/animals_listen_match_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import 'data/data.dart';

class AnimalsListenMatchGame extends ConsumerStatefulWidget {
  const AnimalsListenMatchGame({super.key});

  @override
  ConsumerState<AnimalsListenMatchGame> createState() => _AnimalsListenMatchGameState();
}

class _AnimalsListenMatchGameState extends ConsumerState<AnimalsListenMatchGame> {

  final _player = AudioPlayer();
  int? a;
  int? whichImage;
  List? imageIndexList;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(animalsListenMatchGameServiceProvider);
    final ValueNotifier<int> levels = ValueNotifier<int>(data.currentLevel);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/listen_match_game_images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ValueListenableBuilder(
                      valueListenable: levels,
                      builder: (BuildContext context, int value, Widget? child) {
                        a = Random().nextInt(2);
                        imageIndexList = List.generate(26, (index) => index);
                        imageIndexList!.removeAt(data.currentLevel);
                        whichImage = Random().nextInt(25);
                        if(a == 0){
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  textToSpeech(animalListenMatchNames[data.currentLevel]);
                                },
                                child: Image.asset(
                                    'assets/images/listen_match_game_images/dinleme.png'),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'DİNLE VE EŞLEŞTİR',
                                style: GoogleFonts.comfortaa(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                    )),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.white,
                                      spreadRadius: 4,
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    if(data.currentLevel != 25){
                                      setState(() {
                                        data.currentLevel +=1;
                                      });
                                      _player.setFilePath(
                                          'assets/sounds/correct_answer.mp3'
                                      );
                                      _player.play();
                                    }else if(data.currentLevel == 25){
                                      Navigator.of(context).pop();
                                    }
                                    data.levelLock();
                                  },
                                  child: Image.asset(
                                      animalListenMatchImages[data.currentLevel]),
                                ),
                              ),
                              const SizedBox(height: 25),
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.white,
                                      spreadRadius: 4,
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    _player.setFilePath(
                                        'assets/sounds/incorrect_answer.mp3');
                                    _player.play();
                                  },
                                  child: Image.asset(
                                      animalListenMatchImages[imageIndexList![whichImage!]]),
                                ),
                              ),
                            ],
                          );
                        }else{
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  textToSpeech(animalListenMatchNames[data.currentLevel]);
                                },
                                child: Image.asset(
                                    'assets/images/listen_match_game_images/dinleme.png'),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'DİNLE VE EŞLEŞTİR',
                                style: GoogleFonts.comfortaa(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                    )),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.white,
                                      spreadRadius: 4,
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    _player.setFilePath(
                                        'assets/sounds/incorrect_answer.mp3');
                                    _player.play();
                                  },
                                  child: Image.asset(
                                      animalListenMatchImages[imageIndexList![whichImage!]]),
                                ),
                              ),
                              const SizedBox(height: 25),
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.white,
                                      spreadRadius: 4,
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    if(data.currentLevel != 25){
                                      setState(() {
                                        data.currentLevel +=1;
                                      });
                                      _player.setFilePath(
                                          'assets/sounds/correct_answer.mp3'
                                      );
                                      _player.play();
                                    }else if(data.currentLevel == 25){
                                      Navigator.of(context).pop();
                                    }
                                    data.levelLock();
                                  },
                                  child: Image.asset(
                                      animalListenMatchImages[data.currentLevel]),
                                ),
                              ),
                            ],
                          );
                        }
                      }
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Image(
                            image: AssetImage(
                                'assets/images/listen_match_game_images/exit.png'))),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text('${data.currentLevel+1}/26',
                      style: GoogleFonts.montserratAlternates(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 34
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}