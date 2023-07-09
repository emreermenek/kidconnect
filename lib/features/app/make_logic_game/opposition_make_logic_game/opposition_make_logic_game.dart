import 'dart:math';
import 'package:bootcamp_f32/features/app/make_logic_game/opposition_make_logic_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import 'data/data.dart';


class OppositionMakeLogicGame extends ConsumerStatefulWidget {
  const OppositionMakeLogicGame({super.key});

  @override
  ConsumerState<OppositionMakeLogicGame> createState() => _OppositionMakeLogicGameState();
}

class _OppositionMakeLogicGameState extends ConsumerState<OppositionMakeLogicGame> {
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
    final data = ref.watch(oppositionMakeLogicGameServiceProvider);
    final ValueNotifier<int> levels = ValueNotifier<int>(data.currentLevel);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F0D7),
        body: ValueListenableBuilder(
            valueListenable: levels,
            builder: (BuildContext context, int value, Widget? child) {
              a = Random().nextInt(3);
              imageIndexList = List.generate(14, (index) => index);
              imageIndexList!.removeAt(data.currentLevel);
              whichImage = Random().nextInt(13);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                                onTap: () => Navigator.of(context).pop(),
                                child: const Image(image: AssetImage('assets/images/make_logic_game_images/animals_make_logic_game_images/exit.png'),)
                            ),
                          ),
                          Text('${data.currentLevel+1}/14',
                            style: GoogleFonts.montserratAlternates(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 34
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(image: AssetImage(oppositionMakeLogicImages[data.currentLevel])),
                        const SizedBox(height: 30,),
                        ValueListenableBuilder(
                            valueListenable: levels,
                            builder: (BuildContext context, value, Widget? child) {
                              if(verticalOrHorizontal[data.currentLevel] == 1){
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if(oppositionCorrectAnswer[data.currentLevel] == 1){ //doğru
                                          if(data.currentLevel != 13){
                                            setState(() {
                                              data.currentLevel +=1;
                                            });
                                            _player.setAsset(
                                                'assets/sounds/correct_answer.mp3'
                                            );
                                            _player.play();
                                          }else if(data.currentLevel == 13){
                                            Navigator.of(context).pop();
                                          }
                                          data.levelLock();
                                        }else{   //yanlış
                                          _player.setAsset(
                                              'assets/sounds/incorrect_answer.mp3');
                                          _player.play();
                                        }
                                      },
                                      child: Image(image: AssetImage(oppositionImagesList[data.currentLevel][0])),
                                    ),
                                    const SizedBox(width: 10,),
                                    InkWell(
                                      onTap: () {
                                        if(oppositionCorrectAnswer[data.currentLevel] == 0){ //doğru
                                          if(data.currentLevel != 13){
                                            setState(() {
                                              data.currentLevel +=1;
                                            });
                                            _player.setAsset(
                                                'assets/sounds/correct_answer.mp3'
                                            );
                                            _player.play();
                                          }else if(data.currentLevel == 13){
                                            Navigator.of(context).pop();
                                          }
                                          data.levelLock();
                                        }else{   //yanlış
                                          _player.setAsset(
                                              'assets/sounds/incorrect_answer.mp3');
                                          _player.play();
                                        }
                                      },
                                      child: Image(image: AssetImage(oppositionImagesList[data.currentLevel][1]),),
                                    ),
                                  ],
                                );
                              }else{
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if(oppositionCorrectAnswer[data.currentLevel] == 1){ //doğru
                                          if(data.currentLevel != 13){
                                            setState(() {
                                              data.currentLevel +=1;
                                            });
                                            _player.setAsset(
                                                'assets/sounds/correct_answer.mp3'
                                            );
                                            _player.play();
                                          }else if(data.currentLevel == 13){
                                            Navigator.of(context).pop();
                                          }
                                          data.levelLock();
                                        }else{   //yanlış
                                          _player.setAsset(
                                              'assets/sounds/incorrect_answer.mp3');
                                          _player.play();
                                        }
                                      },
                                      child: Image(image: AssetImage(oppositionImagesList[data.currentLevel][0])),
                                    ),
                                    const SizedBox(height: 20,),
                                    InkWell(
                                      onTap: () {
                                        if(oppositionCorrectAnswer[data.currentLevel] == 0){ //doğru
                                          if(data.currentLevel != 13){
                                            setState(() {
                                              data.currentLevel +=1;
                                            });
                                            _player.setAsset(
                                                'assets/sounds/correct_answer.mp3'
                                            );
                                            _player.play();
                                          }else if(data.currentLevel == 13){
                                            Navigator.of(context).pop();
                                          }
                                          data.levelLock();
                                        }else{   //yanlış
                                          _player.setAsset(
                                              'assets/sounds/incorrect_answer.mp3');
                                          _player.play();
                                        }
                                      },
                                      child: Image(image: AssetImage(oppositionImagesList[data.currentLevel][1]),),
                                    ),
                                  ],
                                );
                              }

                            }
                        )
                      ],
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
