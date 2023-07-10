import 'dart:math';
import 'package:bootcamp_f32/features/app/pouch_games/profession_pouch_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'data/data.dart';


class ProfessionPouchGame extends ConsumerStatefulWidget {
  const ProfessionPouchGame({super.key});

  @override
  ConsumerState<ProfessionPouchGame> createState() => _ProfessionPouchGameState();
}

class _ProfessionPouchGameState extends ConsumerState<ProfessionPouchGame> {
  int firstIndex =0;
  int secondIndex = 0;
  int correctAnswer = 2;
  int a = Random().nextInt(2);
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
    final data = ref.watch(professionPouchGameDataServiceProvider);
    final ValueNotifier<int> levels = ValueNotifier<int>(data.currentLevel);
    int first = 0;
    int second = 0;
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
            valueListenable: levels,
            builder: (BuildContext context, value, Widget? child) {
              if(data.imageIndexList.isEmpty){
                data.currentLevel = 0;
                data.imageIndexList = List.generate(14, (index) => index);
                Navigator.of(context).pop();
              }else{
                data.imageIndexList.shuffle();
                firstIndex = data.imageIndexList[1];
                secondIndex = data.imageIndexList[0];
                a = Random().nextInt(2);
                if(a==0){
                  c = 1;
                }else if(a == 1) {
                  c = 0;
                }
                b = data.imageIndexList[c];
                data.imageIndexList.removeAt(1);
                data.imageIndexList.removeAt(0);
              }

              if(a == 0){
                first = correctAnswer;
              }else if(a == 1){
                second = correctAnswer;
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
                                data.imageIndexList = List.generate(14, (index) => index);
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
                              setState(() {
                                data.currentLevel += 1;
                              });
                              if(data.currentLevel != 7){
                                data.levelLock();
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
                                  child: Text(professionPouchGameNames[b], style: GoogleFonts.quicksand(
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
                          const SizedBox(height: 40,),
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
                                                image: AssetImage(professionPouchGameImages[secondIndex])
                                            )
                                        ),
                                      ),
                                      childWhenDragging: Image(
                                        image: AssetImage(professionPouchGameImages[secondIndex]),
                                        color: Colors.grey,
                                        width: 100,
                                        height: 100,
                                      ),
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(professionPouchGameImages[secondIndex])
                                            )
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 30,),
                                    Draggable<int>(
                                      data: first,
                                      feedback:  Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(professionPouchGameImages[firstIndex])
                                            )
                                        ),
                                      ),
                                      childWhenDragging: Image(
                                        image: AssetImage(professionPouchGameImages[firstIndex]),
                                        color: Colors.grey,
                                        width: 100,
                                        height: 100,
                                      ),
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(professionPouchGameImages[firstIndex])
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
