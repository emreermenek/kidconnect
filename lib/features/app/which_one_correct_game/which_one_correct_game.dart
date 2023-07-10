import 'dart:math';


import 'package:bootcamp_f32/features/app/which_one_correct_game/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import '../biger_or_lower_game/data/numbers.dart';


class WhichOneCorrectGame extends ConsumerStatefulWidget {
  const WhichOneCorrectGame({Key? key}) : super(key: key);

  @override
  ConsumerState<WhichOneCorrectGame> createState() => _WhichOneCorrectGameState();
}

class _WhichOneCorrectGameState extends ConsumerState<WhichOneCorrectGame> {

  int? number1;
  int? number2;
  int? correctAnswer;
  int? number3;
  int? number4;
  int? number5;
  List<int> numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  final _player = AudioPlayer();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }
  int randomNumberGenerator() {
    return Random().nextInt(8);
  }


  @override
  Widget build(BuildContext context) {

    final data = ref.watch(dataServiceProvider2);
    final ValueNotifier<int> levels= ValueNotifier<int>(data.currentLevel);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 85),
              child: Center(
                child: Image(image: AssetImage('assets/images/choose_correct_images/background.png'),),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: levels,
              builder: (BuildContext context, value, Widget? child) {
                number1 = randomNumberGenerator();
                number2 = number1! + 1;
                correctAnswer = number2! +1;
                numbers.remove(correctAnswer!);
                int number3 = numbers[Random().nextInt(numbers.length)];
                do {
                  number4 = numbers[Random().nextInt(numbers.length)];
                } while (number4 == number3);
                do {
                  number5 = numbers[Random().nextInt(numbers.length)];
                } while (number5 == number3 || number5 == number4);
                numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 85),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Image(image: AssetImage('assets/images/choose_correct_images/geri button.png'))),
                          Text('${data.currentLevel+1}/10', style: GoogleFonts.gluten(
                            textStyle:  const TextStyle(
                                color: Color(0xFF16519F),
                                fontSize: 36,
                                fontWeight: FontWeight.bold
                            ),
                          ),)
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 112,
                            height: 148,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/whichOneGame_images/table_man_1.png'),
                                )
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 80,),
                                Image(image: AssetImage(numberImages[number1!]),width: 22,height: 40,)
                              ],)
                        ),
                        Container(
                            width: 112,
                            height: 148,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/whichOneGame_images/table_man_2.png'),
                                )
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 80,),
                                Image(image: AssetImage(numberImages[number2!]),width: 22,height: 40,)
                              ],)
                        ),
                        Container(
                            width: 112,
                            height: 148,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/whichOneGame_images/table_girl.png'),
                                )
                            ),
                            child: const Column(
                              children: [
                                SizedBox(height: 80,),
                                Image(image: AssetImage('assets/images/numbers_marks_images/question_mark.png'),width: 22,height: 35,)
                              ],)
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('? Yerine\naşağıdaki\nsayılardan\nhangisi\ngelmeli',style: GoogleFonts.gluten(
                          textStyle:  const TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold
                          ),
                        ),),
                        const SizedBox(width: 30,),
                        const Image(image: AssetImage('assets/images/whichOneGame_images/tiger_looking_side.png'))
                      ],
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            if(data.currentLevel == 2 || data.currentLevel == 5 || data.currentLevel == 9 )
                            {
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
                              data.levelLock();
                            }else{
                              _player.setAsset(
                                  'assets/sounds/incorrect_answer.mp3');
                              _player.play();
                            }
                          },
                          child: ValueListenableBuilder(
                            valueListenable: levels,
                            builder: (BuildContext context, int value, Widget? child) {
                              if(data.currentLevel == 2 || data.currentLevel == 5 || data.currentLevel == 9  ){
                                return Container(
                                  width: 107,
                                  height: 74,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/whichOneGame_images/çerçeve 1.png'),
                                      )
                                  ),
                                  child: Center(
                                      child:Image(image: AssetImage(numberImages[correctAnswer!]),width: 22,height: 35,)
                                  ),
                                );
                              }else{
                                return Container(
                                  width: 107,
                                  height: 74,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/whichOneGame_images/çerçeve 1.png'),
                                      )
                                  ),
                                  child: Center(
                                      child:Image(image: AssetImage(numberImages[number3]),width: 22,height: 35,)
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 10,),
                        InkWell(
                          onTap: () {
                            if(data.currentLevel == 0 || data.currentLevel == 1 || data.currentLevel == 8 )
                            {
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
                              data.levelLock();
                            }else{
                              _player.setAsset(
                                  'assets/sounds/incorrect_answer.mp3');
                              _player.play();
                            }
                          },
                          child: ValueListenableBuilder(
                            valueListenable: levels,
                            builder: (BuildContext context, value, Widget? child) {
                              if(data.currentLevel == 0 || data.currentLevel == 1 || data.currentLevel == 8 ){
                                return Container(
                                  width: 107,
                                  height: 74,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/whichOneGame_images/çerçeve 3.png'),
                                      )
                                  ),
                                  child: Center(
                                      child:Image(image: AssetImage(numberImages[correctAnswer!]),width: 22,height: 35,)
                                  ),
                                );
                              }else{
                                return Container(
                                  width: 107,
                                  height: 74,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/whichOneGame_images/çerçeve 1.png'),
                                      )
                                  ),
                                  child: Center(
                                      child:Image(image: AssetImage(numberImages[number4!]),width: 22,height: 35,)
                                  ),
                                );
                              }

                            },
                          ),
                        ),
                        const SizedBox(width: 10,),
                        InkWell(
                          onTap: () {
                            if(data.currentLevel == 3 || data.currentLevel == 4 || data.currentLevel == 6 || data.currentLevel == 7 )
                            {
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
                              data.levelLock();
                            }else{
                              _player.setAsset(
                                  'assets/sounds/incorrect_answer.mp3');
                              _player.play();
                            }
                          },
                          child: ValueListenableBuilder(
                            valueListenable: levels,
                            builder: (BuildContext context, value, Widget? child) {
                              if(data.currentLevel == 3 || data.currentLevel == 4 || data.currentLevel == 6 || data.currentLevel == 7 ){
                                return Container(
                                  width: 107,
                                  height: 74,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/whichOneGame_images/çerçeve 3.png'),
                                      )
                                  ),
                                  child: Center(
                                      child:Image(image: AssetImage(numberImages[correctAnswer!]),width: 22,height: 35,)
                                  ),
                                );
                              }else{
                                return Container(
                                  width: 107,
                                  height: 74,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/whichOneGame_images/çerçeve 3.png'),
                                      )
                                  ),
                                  child: Center(
                                      child:Image(image: AssetImage(numberImages[number5!]),width: 22,height: 35,)
                                  ),
                                );
                              }

                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
