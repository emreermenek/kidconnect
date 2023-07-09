import 'package:bootcamp_f32/features/app/shadow_games/body_shadow_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import 'data/data.dart';

class BodyShadowGame extends ConsumerStatefulWidget {
  const BodyShadowGame({super.key});

  @override
  ConsumerState<BodyShadowGame> createState() => _BodyShadowGameState();
}

class _BodyShadowGameState extends ConsumerState<BodyShadowGame> {

  int firstIndex =0;
  int secondIndex = 0;
  int thirdIndex = 0;

  final _player = AudioPlayer();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(bodyShadowGameDataServiceProvider);
    final ValueNotifier<int> levels = ValueNotifier<int>(data.currentLevel);

    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
            valueListenable: levels,
            builder: (BuildContext context, value, Widget? child) {
              if(data.imageIndexList.length == 0){
                data.currentLevel = 0;
                data.imageIndexList = List.generate(12, (index) => index);
                data.correctAnswerNumber = 0;
                Navigator.of(context).pop();
              }else{
                data.imageIndexList.shuffle();
                firstIndex = data.imageIndexList[2];
                secondIndex = data.imageIndexList[1];
                thirdIndex = data.imageIndexList[0];
                data.imageIndexList.removeAt(2);
                data.imageIndexList.removeAt(1);
                data.imageIndexList.removeAt(0);
              }

              Color color1 = Colors.grey;
              Color color2 = Colors.grey;
              Color color3 = Colors.grey;
              return Stack(
                children: [
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Image(
                      image: AssetImage(
                          'assets/images/shadow_games/background/bottom_left_background.png'),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Image(
                      image: AssetImage(
                          'assets/images/shadow_games/background/bottom_right_background.png'),
                    ),
                  ),
                  const Positioned(
                    left: 0,
                    bottom: 220,
                    child: Image(
                      image: AssetImage(
                          'assets/images/shadow_games/background/left_background.png'),
                    ),
                  ),
                  const Positioned(
                    right: 0,
                    bottom: 220,
                    child: Image(
                      image: AssetImage(
                          'assets/images/shadow_games/background/right_background.png'),
                    ),
                  ),
                  /*
              ------------------------
                      column
              ------------------------
              */
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 400,),
                        SizedBox(
                          height: 300,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Draggable<int>(
                                    data: secondIndex,
                                    feedback:  Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(bodyShadowGameImages[secondIndex])
                                          )
                                      ),
                                    ),
                                    childWhenDragging: Image(
                                      image: AssetImage(bodyShadowGameImages[secondIndex]),
                                      color: Colors.grey,
                                      width: 100,
                                      height: 100,
                                    ),
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(bodyShadowGameImages[secondIndex])
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
                                    data: firstIndex,
                                    feedback:  Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(bodyShadowGameImages[firstIndex])
                                          )
                                      ),
                                    ),
                                    childWhenDragging: Image(
                                      image: AssetImage(bodyShadowGameImages[firstIndex]),
                                      color: Colors.grey,
                                      width: 100,
                                      height: 100,
                                    ),
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(bodyShadowGameImages[firstIndex])
                                          )
                                      ),
                                    ),
                                  ),
                                  Draggable<int>(
                                    data: thirdIndex,
                                    feedback:  Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(bodyShadowGameImages[thirdIndex])
                                          )
                                      ),
                                    ),
                                    childWhenDragging: Image(
                                      image: AssetImage(bodyShadowGameImages[thirdIndex]),
                                      color: Colors.grey,
                                      width: 100,
                                      height: 100,
                                    ),
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(bodyShadowGameImages[thirdIndex])
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
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 325,
                          decoration: const BoxDecoration(
                              color: Color(0xFFD27070),
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(24),
                              )
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 150,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  DragTarget<int>(
                                    builder: (BuildContext context, List<int?> candidateData, List<dynamic> rejectedData) =>Image(
                                      image: AssetImage(bodyShadowGameImages[firstIndex]),
                                      color: color1,
                                      width: 100,
                                      height: 100,
                                    ),
                                    onWillAccept: (input) {
                                      if(input == firstIndex){
                                        return true;
                                      }else{
                                        _player.setAsset(
                                            'assets/sounds/incorrect_answer.mp3');
                                        _player.play();
                                        return false;
                                      }
                                    },
                                    onAccept: (input) {
                                      if(color1 == Colors.grey){
                                        color1 = Colors.transparent;
                                        if(data.correctAnswerNumber != 2){
                                          _player.setAsset(
                                              'assets/sounds/correct_answer.mp3'
                                          );
                                          _player.play();
                                          data.correctAnswerNumber +=1;
                                        }else{

                                          _player.setAsset(
                                              'assets/sounds/correct_answer.mp3'
                                          );
                                          _player.play();
                                          setState(() {
                                            data.currentLevel += 1;
                                            data.correctAnswerNumber = 0;
                                          });
                                          if(data.currentLevel != 4){
                                            data.levelLock();
                                          }
                                        }
                                      }

                                    },
                                  ),
                                  DragTarget<int>(
                                    builder: (BuildContext context, List<int?> candidateData, List<dynamic> rejectedData) =>Image(
                                      image: AssetImage(bodyShadowGameImages[secondIndex]),
                                      color: color2,
                                      width: 100,
                                      height: 100,
                                    ),
                                    onWillAccept: (input) {
                                      if(input == secondIndex){
                                        return true;
                                      }else{
                                        _player.setAsset(
                                            'assets/sounds/incorrect_answer.mp3');
                                        _player.play();
                                        return false;
                                      }
                                    },
                                    onAccept: (input) {
                                      if(color2 == Colors.grey){
                                        color2 = Colors.transparent;
                                        if(data.correctAnswerNumber != 2){
                                          _player.setAsset(
                                              'assets/sounds/correct_answer.mp3'
                                          );
                                          _player.play();
                                          data.correctAnswerNumber +=1;
                                        }else{

                                          _player.setAsset(
                                              'assets/sounds/correct_answer.mp3'
                                          );
                                          _player.play();
                                          setState(() {
                                            data.currentLevel += 1;
                                            data.correctAnswerNumber = 0;
                                          });
                                          if(data.currentLevel != 4){
                                            data.levelLock();
                                          }
                                        }
                                      }
                                    },
                                  ),
                                  DragTarget<int>(
                                    builder: (BuildContext context, List<int?> candidateData, List<dynamic> rejectedData) =>Image(
                                      image: AssetImage(bodyShadowGameImages[thirdIndex]),
                                      color: color3,
                                      width: 100,
                                      height: 100,
                                    ),
                                    onWillAccept: (input) {
                                      if(input == thirdIndex){
                                        return true;
                                      }else{
                                        _player.setAsset(
                                            'assets/sounds/incorrect_answer.mp3');
                                        _player.play();
                                        return false;
                                      }
                                    },
                                    onAccept: (input) {
                                      if(color3 == Colors.grey){
                                        color3 = Colors.transparent;
                                        if(data.correctAnswerNumber != 2){
                                          _player.setAsset(
                                              'assets/sounds/correct_answer.mp3'
                                          );
                                          _player.play();

                                          data.correctAnswerNumber +=1;

                                        }else{

                                          _player.setAsset(
                                              'assets/sounds/correct_answer.mp3'
                                          );
                                          _player.play();
                                          setState(() {
                                            data.currentLevel += 1;
                                            data.correctAnswerNumber = 0;
                                          });
                                          if(data.currentLevel != 4){
                                            data.levelLock();
                                          }
                                        }
                                      }

                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*
              ------------------------
                      column
              ------------------------
              */


                  const Positioned(
                      top: 10,
                      right: 10,
                      child: Image(
                          image: AssetImage(
                              'assets/images/shadow_games/background/tiger_looking_down.png'))),
                  Column(
                    children: [
                      const SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '            HADİ!\nGÖLGESİNİ BULALIM',
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            data.currentLevel = 0;
                            data.imageIndexList = List.generate(12, (index) => index);
                            data.correctAnswerNumber = 0;
                          },
                          child: const Image(
                            image: AssetImage(
                                'assets/images/shadow_games/background/exit_button.png'),
                          )),
                    ),
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
}
