import 'dart:math';
import 'package:bootcamp_f32/features/app/pouch_games/opposition_pouch_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import 'data/data.dart';

class OppositionPouchGame extends ConsumerStatefulWidget {
  const OppositionPouchGame({super.key});

  @override
  ConsumerState<OppositionPouchGame> createState() => _OppositionPouchGameState();
}

class _OppositionPouchGameState extends ConsumerState<OppositionPouchGame> {
  int firstIndex =0;
  int secondIndex = 0;
  int thirdIndex = 0;
  int correctAnswer = 3;
  int a = Random().nextInt(3);
  int b = 0;
  int c = 0;
  final _player = AudioPlayer();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(oppositionPouchGameDataServiceProvider);
    final ValueNotifier<int> levels = ValueNotifier<int>(data.currentLevel);
    int first = 0;
    int second = 0;
    int third = 0;
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
            valueListenable: levels,
            builder: (BuildContext context, value, Widget? child) {
              if(data.imageIndexList.isEmpty){
                data.currentLevel = 0;
                data.imageIndexList = List.generate(36, (index) => index);
                Navigator.of(context).pop();
              }else{
                data.imageIndexList.shuffle();
                firstIndex = data.imageIndexList[2];
                secondIndex = data.imageIndexList[1];
                thirdIndex = data.imageIndexList[0];
                a = Random().nextInt(3);
                if(a==0){
                  c = 2;
                }else if(a == 1){
                  c = 1;
                }else{
                  c = 0;
                }
                b = data.imageIndexList[c];
                data.imageIndexList.removeAt(2);
                data.imageIndexList.removeAt(1);
                data.imageIndexList.removeAt(0);
              }

              if(a == 0){
                first = correctAnswer;
              }else if(a == 1){
                second = correctAnswer;
              }else{
                third = correctAnswer;
              }

              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/pouch_game_images/background.png'),
                        fit: BoxFit.fill
                    )
                ),
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                                data.currentLevel = 0;
                                data.imageIndexList = List.generate(36, (index) => index);
                              },
                              child: const Image(image: AssetImage(
                                  'assets/images/pouch_game_images/exit.png')
                              )
                          ),
                        ),
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: DragTarget(
                            builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) => const Image(image: AssetImage(
                                'assets/images/pouch_game_images/torba.png'),),
                            onWillAccept: (input) {
                              if(input == correctAnswer){
                                return true;
                              }else{
                                _player.setAsset(
                                    'assets/sounds/incorrect_answer.mp3');
                                _player.play();
                                return false;
                              }
                            },
                            onAccept: (input) {
                              _player.setAsset(
                                  'assets/sounds/correct_answer.mp3'
                              );
                              _player.play();
                              if(data.currentLevel != 11){
                                data.currentLevel += 1;
                                data.levelLock();
                              }else{
                                Navigator.of(context).pop();
                              }
                            },
                          )
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 230,),
                          Row(
                            children: [
                              const SizedBox(width: 20,),
                              Container(
                                width: 285,
                                height: 88,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF6D5D5),
                                    border: Border.all(
                                        width: 5,
                                        color: const Color(0xFF014388)
                                    ),
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                child: Center(
                                  child: Text(oppositionPouchGameNames[b], style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          fontSize: 40,
                                          color: Color(0xFF014388),
                                          fontWeight: FontWeight.bold
                                      )
                                  ),),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          SizedBox(
                            height: 300,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Draggable<int>(
                                      data: second,
                                      feedback:  Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(oppositionPouchGameImages[secondIndex])
                                            )
                                        ),
                                      ),
                                      childWhenDragging: Image(
                                        image: AssetImage(oppositionPouchGameImages[secondIndex]),
                                        color: Colors.grey,
                                        width: 100,
                                        height: 100,
                                      ),
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(oppositionPouchGameImages[secondIndex])
                                            )
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Draggable<int>(
                                      data: first,
                                      feedback:  Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(oppositionPouchGameImages[firstIndex])
                                            )
                                        ),
                                      ),
                                      childWhenDragging: Image(
                                        image: AssetImage(oppositionPouchGameImages[firstIndex]),
                                        color: Colors.grey,
                                        width: 100,
                                        height: 100,
                                      ),
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(oppositionPouchGameImages[firstIndex])
                                            )
                                        ),
                                      ),
                                    ),
                                    Draggable<int>(
                                      data: third,
                                      feedback:  Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(oppositionPouchGameImages[thirdIndex])
                                            )
                                        ),
                                      ),
                                      childWhenDragging: Image(
                                        image: AssetImage(oppositionPouchGameImages[thirdIndex]),
                                        color: Colors.grey,
                                        width: 100,
                                        height: 100,
                                      ),
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(oppositionPouchGameImages[thirdIndex])
                                            )
                                        ),
                                      ),
                                    ),
                                  ],

                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}