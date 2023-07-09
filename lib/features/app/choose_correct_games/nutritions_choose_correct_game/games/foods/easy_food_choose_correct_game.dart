import 'dart:math';

import 'package:bootcamp_f32/features/app/choose_correct_games/nutritions_choose_correct_game/services/foods_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import '../../data/foods.dart';

class EasyFoodChooseCorrectGame extends ConsumerStatefulWidget {
  const EasyFoodChooseCorrectGame({Key? key}) : super(key: key);

  @override
  ConsumerState<EasyFoodChooseCorrectGame> createState() =>
      _EasyFoodChooseCorrectGameState();
}

class _EasyFoodChooseCorrectGameState
    extends ConsumerState<EasyFoodChooseCorrectGame> {

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
    final data = ref.watch(foodChooseCorrectGameServiceProvider);
    final ValueNotifier<int> levels = ValueNotifier<int>(data.currentLevelEasy);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 234, 206, 100),
        body: SizedBox(
          height: double.infinity,
          child: ValueListenableBuilder(
              valueListenable: levels,
              builder: (BuildContext context, value, Widget? child) {
                a = Random().nextInt(3);
                imageIndexList = List.generate(10, (index) => index);
                imageIndexList!.removeAt(data.currentLevelEasy);
                whichImage = Random().nextInt(9);
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: 300,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/choose_correct_games/color_choose_correct_game_images/background_bottom_full.png'),
                              fit: BoxFit.fill
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 40,),
                            Row(
                              children: [
                                SizedBox(width:size.width*0.35),
                                Text('${foodNamesList[data.currentLevelEasy]}\nbulalım', style: GoogleFonts.comfortaa(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ), textScaleFactor: 1.5,)

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      setState(() {
                                        data.currentLevelEasy = 0;
                                      });
                                    },
                                    child: const Image(image: AssetImage('assets/images/choose_correct_games/color_choose_correct_game_images/exit.png'))
                                ),
                                Text('${data.currentLevelEasy+1}/10',
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
                          ValueListenableBuilder(
                            valueListenable: levels,
                            builder: (context, value, child) {
                              if(a == 0){
                                return SizedBox(
                                  height: 400,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          InkWell(
                                              onTap: (){

                                                if(data.currentLevelEasy != 9){
                                                  setState(() {
                                                    data.currentLevelEasy +=1;
                                                  });
                                                  _player.setAsset(
                                                      'assets/sounds/correct_answer.mp3'
                                                  );
                                                  _player.play();
                                                }else if(data.currentLevelEasy == 9){
                                                  Navigator.of(context).pop();
                                                }
                                                data.levelLockEasy();
                                              },
                                              child: Image(image: AssetImage(foodImagesList[data.currentLevelEasy]),width: 200)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const SizedBox(height: 100,),
                                          InkWell(
                                              onTap: (){
                                                _player.setAsset(
                                                    'assets/sounds/incorrect_answer.mp3');
                                                _player.play();
                                              },
                                              child: Image(image: AssetImage(foodImagesList[imageIndexList![whichImage!]]),width: 200)),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }else if(a==1){
                                return SizedBox(
                                  height: 400,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          InkWell(
                                              onTap: (){
                                                _player.setAsset(
                                                    'assets/sounds/incorrect_answer.mp3');
                                                _player.play();
                                              },
                                              child: Image(image: AssetImage(foodImagesList[imageIndexList![whichImage!]]),width: 200)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const SizedBox(height: 100,),
                                          InkWell(
                                              onTap: (){

                                                if(data.currentLevelEasy != 9){
                                                  setState(() {
                                                    data.currentLevelEasy +=1;
                                                  });
                                                  _player.setAsset(
                                                      'assets/sounds/correct_answer.mp3'
                                                  );
                                                  _player.play();
                                                }else if(data.currentLevelEasy == 9){
                                                  Navigator.of(context).pop();
                                                }
                                                data.levelLockEasy();
                                              },
                                              child: Image(image: AssetImage(foodImagesList[data.currentLevelEasy]),width: 200)),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }else{
                                return SizedBox(
                                  height: 400,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(height: 100,),
                                          InkWell(
                                              onTap: (){
                                                _player.setAsset(
                                                    'assets/sounds/incorrect_answer.mp3');
                                                _player.play();
                                              },
                                              child: Image(image: AssetImage(foodImagesList[imageIndexList![whichImage!]]),width: 200)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          InkWell(
                                              onTap: (){

                                                if(data.currentLevelEasy != 9){
                                                  setState(() {
                                                    data.currentLevelEasy +=1;
                                                  });
                                                  _player.setAsset(
                                                      'assets/sounds/correct_answer.mp3'
                                                  );
                                                  _player.play();
                                                }else if(data.currentLevelEasy == 9){
                                                  Navigator.of(context).pop();
                                                }
                                                data.levelLockEasy();
                                              },
                                              child: Image(image: AssetImage(foodImagesList[data.currentLevelEasy]),width: 200)),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }

                            },
                          )
                        ],
                      ),
                    )

                  ],
                );
              }
          ),
        ),
      ),
    );
  }
}