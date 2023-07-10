import 'dart:math';

import 'package:bootcamp_f32/features/app/how_many_image_game/data/fruit_data.dart';
import 'package:bootcamp_f32/features/app/how_many_image_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import '../biger_or_lower_game/data/numbers.dart';

class HowManyImageGame extends ConsumerStatefulWidget {
  const HowManyImageGame({super.key});

  @override
  ConsumerState<HowManyImageGame> createState() => _HowManyImageGameState();
}

class _HowManyImageGameState extends ConsumerState<HowManyImageGame> {
  List<int> shapeCount = [1,2,3,4,5,6,7,8,9,];
  int image = Random().nextInt(6);
  int shapes = Random().nextInt(9) + 1;
  int? correctNumber;
  int? number1;
  int? number2;
  List<int> numberIndexList = [0,1,2,3,4,5,6,7,8];
  final _player = AudioPlayer();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(dataServiceProvider3);
    final ValueNotifier<int> levels = ValueNotifier<int>(data.currentLevel);
    final ValueNotifier<int> imageDataNotifier = ValueNotifier<int>(data.currentLevel);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: ValueListenableBuilder(
          valueListenable: levels,
          builder: (context, value, child)
          {
            image = Random().nextInt(6);
            shapes = Random().nextInt(9) + 1;
            correctNumber = shapes;
            numberIndexList.remove(correctNumber!-1);
            do {
              number1 = numberIndexList[Random().nextInt(numberIndexList.length)];
            } while (number1 == correctNumber);
            numberIndexList.remove(number1!-1);
            do {
              number2 = numberIndexList[Random().nextInt(numberIndexList.length)];
            } while (number2 == number1 || number2 == correctNumber);
            numberIndexList = [0,1,2,3,4,5,6,7,8];
            return SingleChildScrollView(
              child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 85),
                  child: Center(
                    child: Image(image: AssetImage('assets/images/choose_correct_games/number_choose_correct_images/background.png'),),
                  ),
                ),
                Column(
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
                              child: const Image(image: AssetImage('assets/images/choose_correct_games/number_choose_correct_images/geri button.png'))),
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
                    Container(
                      width: 292,
                      height: 292,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.white,
                      ),
                      child: ValueListenableBuilder(
                        valueListenable: imageDataNotifier,
                        builder: (context, value, child) {
                          if(shapes == shapeCount[0]){
                            return Center(
                              child: Image(image: AssetImage(fruitImage[image]),width: 100,),
                            );
                          }else if(shapes == shapeCount[1]){
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(image: AssetImage(fruitImage[image]),width: 100,),
                                Image(image: AssetImage(fruitImage[image]),width: 100,),
                              ],
                            );
                          }else if(shapes == shapeCount[2]){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                    Image(image: AssetImage(fruitImage[image]),width: 100,),
                                    Image(image: AssetImage(fruitImage[image]),width: 100,),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage(fruitImage[image]),width: 100,),
                                  ],
                                ),
                              ],
                            );
                          }else if(shapes == shapeCount[3]){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage(fruitImage[image]),width: 100,),
                                    Image(image: AssetImage(fruitImage[image]),width: 100,),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage(fruitImage[image]),width: 100,),
                                    Image(image: AssetImage(fruitImage[image]),width: 100,),
                                  ],
                                ),
                              ],
                            );
                          }else if(shapes == shapeCount[4]){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                  ],
                                ),
                              ],
                            );
                          }else if(shapes == shapeCount[5]){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                  ],
                                ),
                              ],
                            );
                          }else if(shapes == shapeCount[6]){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                  ],
                                ),
                              ],
                            );
                          }else if(shapes == shapeCount[7]){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                  ],
                                ),
                              ],
                            );
                          }else{
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                    Image(image: AssetImage(fruitImage[image]),width: 80,),
                                  ],
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(image: AssetImage('assets/images/how_many_image_game/thinking_lion.png')),
                        const SizedBox(width: 15,),
                        Text('  Ekranda\n kaç tane\n${fruitNames[image]} resmi\n     var?', style: GoogleFonts.gluten(
                          textStyle:  const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            if(data.currentLevel == 0 || data.currentLevel == 3 || data.currentLevel == 5 )
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
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.white
                            ),
                            child: ValueListenableBuilder(
                                valueListenable: levels,
                                builder: (BuildContext context, value, Widget? child) {
                                  if(data.currentLevel == 0 ||data.currentLevel == 3 || data.currentLevel == 5){
                                    return Image(image: AssetImage(numberImages[correctNumber!]),);
                                  }else{
                                    return Image(image: AssetImage(numberImages[number1!]),);
                                  }
                                },
                             ),
                          ),
                        ),
                        const SizedBox(width: 15,),
                        InkWell(
                          onTap: () {
                            if(data.currentLevel == 1 || data.currentLevel == 4 || data.currentLevel == 6 || data.currentLevel == 8)
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
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.white
                            ),
                            child: ValueListenableBuilder(
                              valueListenable: levels,
                              builder: (BuildContext context, value, Widget? child) {
                                if(data.currentLevel == 1 ||data.currentLevel == 4 || data.currentLevel == 6 || data.currentLevel == 8){
                                  return Image(image: AssetImage(numberImages[correctNumber!]),);
                                }else{
                                  return Image(image: AssetImage(numberImages[number2!]),);
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 15,),
                        InkWell(
                          onTap: () {
                            if(data.currentLevel == 2 || data.currentLevel == 7 || data.currentLevel == 9 )
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
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.white
                            ),
                            child: ValueListenableBuilder(
                              valueListenable: levels,
                              builder: (BuildContext context, value, Widget? child) {
                                if(data.currentLevel == 2 ||data.currentLevel == 7 || data.currentLevel == 9){
                                  return Image(image: AssetImage(numberImages[correctNumber!]),);
                                }else{
                                  if(data.currentLevel == 1 ||data.currentLevel == 4 || data.currentLevel == 6 || data.currentLevel == 8){
                                    return Image(image: AssetImage(numberImages[number2!]),);
                                  }else{
                                    return Image(image: AssetImage(numberImages[number1!]),);
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
          ),
            );
  }
        ),
      ),
    );
  }
}
