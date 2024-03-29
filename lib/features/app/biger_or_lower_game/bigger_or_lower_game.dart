import 'dart:math';

import 'package:bootcamp_f32/features/app/biger_or_lower_game/data/numbers.dart';
import 'package:bootcamp_f32/features/app/biger_or_lower_game/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class BiggerOrLowerGame extends ConsumerStatefulWidget {
  const BiggerOrLowerGame({super.key});

  @override
  ConsumerState<BiggerOrLowerGame> createState() => _BiggerOrLowerGameState();
}

class _BiggerOrLowerGameState extends ConsumerState<BiggerOrLowerGame> {
  int? number1;
  int? number2;
  int? correctMark;
  List<int> numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  List<bool> trueAnswer = [
    false,  //number1 > number2
    false,  //number1 < number2
    false,  //number1 = number2
  ];
  final _player = AudioPlayer();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(dataServiceProvider4);
    final ValueNotifier<int> levels = ValueNotifier<int>(data.currentLevel);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: ValueListenableBuilder(
          valueListenable: levels,
          builder: (BuildContext context, int value, Widget? child) {
            trueAnswer = [
              false,  //number1 > number2
              false, //number1 = number2
              false,  //number1 < number2
            ];
            number1 = Random().nextInt(9);
            numbers.remove(number1);
            number2 = numbers[Random().nextInt(numbers.length)];
            numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
            if(number1! > number2!){
              trueAnswer[0] = true;
            }else if(number1! == number2!){
              trueAnswer[1] = true;
            }else{
              trueAnswer[2] = true;
            }
            return SingleChildScrollView(
              child: Stack(
                children: [
                  const Center(
                    child: Image(image: AssetImage(
                        'assets/images/choose_correct_games/number_choose_correct_images/background.png'),),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Image(image: AssetImage(
                                    'assets/images/choose_correct_games/number_choose_correct_images/geri button.png'))),
                            Text('${data.currentLevel + 1}/10',
                              style: GoogleFonts.gluten(
                                textStyle: const TextStyle(
                                    color: Color(0xFF16519F),
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold
                                ),
                              ),)
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
                      const Align(
                          alignment: Alignment.topRight,
                          child: Image(image: AssetImage(
                              'assets/images/biggerOrLowerGame_images/anxious_tiger.png'),)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: Colors.white
                              ),
                              child: ValueListenableBuilder(
                                valueListenable: levels,
                                builder: (BuildContext context, value,
                                    Widget? child) {
                                  return Image(image: AssetImage(
                                      numberImages[number1!]),);
                                },
                              )
                          ),
                          const SizedBox(width: 15,),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.white
                            ),
                            child: const Image(image: AssetImage(
                                'assets/images/numbers_marks_images/question_mark.png'),),
                          ),
                          const SizedBox(width: 15,),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.white
                            ),
                            child: ValueListenableBuilder(
                              valueListenable: levels,
                              builder: (BuildContext context, value,
                                  Widget? child) {
                                return Image(image: AssetImage(
                                    numberImages[number2!]),);
                              },
                            )
                          )
                        ],
                      ),
                      const SizedBox(height: 25,),
                      Text('      ? Yerine\naşağıdakilerden\nhangisi gelmeli',
                        style: GoogleFonts.gluten(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold
                          ),
                        ),),
                      const SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.white
                            ),
                            child: InkWell(
                              onTap: () {
                                for(int i = 0; i < 3; i++){
                                  if(trueAnswer[i] == true){
                                    if(i==0){
                                      _player.setAsset(
                                          'assets/sounds/correct_answer.mp3'
                                      );
                                      _player.play();
                                      setState(() {
                                        data.currentLevel += 1;
                                      });

                                      if(data.currentLevel == 10){
                                        Navigator.of(context).pop();
                                      }
                                      if(data.currentLevel !=10){
                                        data.levelLock();
                                      }

                                    }else{
                                      _player.setAsset(
                                          'assets/sounds/incorrect_answer.mp3');
                                      _player.play();
                                    }
                                  }
                                }
                              },
                              child: const Image(image: AssetImage(
                                  'assets/images/numbers_marks_images/bigger.png'),),
                            ),
                          ),
                          const SizedBox(width: 15,),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.white
                            ),
                            child: InkWell(
                              onTap: () {
                                for(int i = 0; i < 3; i++){
                                  if(trueAnswer[i] == true){
                                    if(i==1){
                                      _player.setAsset(
                                          'assets/sounds/correct_answer.mp3'
                                      );
                                      _player.play();
                                      setState(() {
                                        data.currentLevel += 1;
                                      });

                                      if(data.currentLevel == 10){
                                        Navigator.of(context).pop();
                                      }
                                      if(data.currentLevel !=10){
                                        data.levelLock();
                                      }
                                    }else{
                                      _player.setAsset(
                                          'assets/sounds/incorrect_answer.mp3');
                                      _player.play();
                                    }
                                  }
                                }
                              },
                              child: const Image(image: AssetImage(
                                  'assets/images/numbers_marks_images/=.png'),),
                            ),
                          ),
                          const SizedBox(width: 15,),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.white
                            ),
                            child: InkWell(
                              onTap: () {
                                for(int i = 0; i < 3; i++){
                                  if(trueAnswer[i] == true){
                                    if(i==2){
                                      _player.setAsset(
                                          'assets/sounds/correct_answer.mp3'
                                      );
                                      _player.play();
                                      setState(() {
                                        data.currentLevel += 1;
                                      });

                                      if(data.currentLevel == 10){
                                        Navigator.of(context).pop();
                                      }
                                      if(data.currentLevel !=10){
                                        data.levelLock();
                                      }
                                    }else{
                                      _player.setAsset(
                                          'assets/sounds/incorrect_answer.mp3');
                                      _player.play();
                                    }
                                  }
                                }
                              },
                              child: const Image(image: AssetImage(
                                  'assets/images/numbers_marks_images/lower.png'),),
                            ),
                          ),
                        ],
                      ),
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
