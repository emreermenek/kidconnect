import 'dart:math';

import 'package:bootcamp_f32/features/app/choose_correct_games/cleaning_choose_correct_game/services/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import 'data/data.dart';

class HardCleaningChooseCorrectGame extends ConsumerStatefulWidget {
  const HardCleaningChooseCorrectGame({Key? key}) : super(key: key);

  @override
  ConsumerState<HardCleaningChooseCorrectGame> createState() =>
      _HardCleaningChooseCorrectGameState();
}

class _HardCleaningChooseCorrectGameState
    extends ConsumerState<HardCleaningChooseCorrectGame> {

  final _player = AudioPlayer();
  int? a;
  int? whichImage;
  int? whichImage2;
  List? imageIndexList;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(cleaningChooseCorrectGameServiceProvider);
    final ValueNotifier<int> levels = ValueNotifier<int>(data.currentLevelHard);
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
                imageIndexList = List.generate(14, (index) => index);
                imageIndexList!.removeAt(data.currentLevelHard);
                whichImage = Random().nextInt(12);
                imageIndexList!.removeAt(whichImage!);
                whichImage2 = Random().nextInt(11);

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
                            const SizedBox(height: 30,),
                            Row(
                              children: [
                                SizedBox(width:size.width*0.25),
                                Text('${cleaningNamesList[data.currentLevelHard]}\n   bulalım', style: GoogleFonts.comfortaa(
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
                                        data.currentLevelHard = 0;
                                      });
                                    },
                                    child: const Image(image: AssetImage('assets/images/choose_correct_games/color_choose_correct_game_images/exit.png'))
                                ),
                                Text('${data.currentLevelHard+1}/14',
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
                                          const SizedBox(height: 100,),
                                          InkWell(
                                              onTap: (){
                                                _player.setFilePath(
                                                    'assets/sounds/incorrect_answer.mp3');
                                                _player.play();
                                              },
                                              child: Image(image: AssetImage(cleaningImagesList[imageIndexList![whichImage!]]),width: 120,)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          InkWell(
                                              onTap: (){
                                                _player.setFilePath(
                                                    'assets/sounds/correct_answer.mp3'
                                                );
                                                _player.play();
                                                if(data.currentLevelHard != 13){
                                                  setState(() {
                                                    data.currentLevelHard +=1;
                                                  });
                                                }else if(data.currentLevelHard == 13){
                                                  Navigator.of(context).pop();
                                                }
                                                data.levelLockHard();
                                              },
                                              child: Image(image: AssetImage(cleaningImagesList[data.currentLevelHard]),width: 120,)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const SizedBox(height: 100,),
                                          InkWell(
                                              onTap: (){
                                                _player.setFilePath(
                                                    'assets/sounds/incorrect_answer.mp3');
                                                _player.play();
                                              },
                                              child: Image(image: AssetImage(cleaningImagesList[imageIndexList![whichImage2!]]),width: 120,)),
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
                                                _player.setFilePath(
                                                    'assets/sounds/correct_answer.mp3'
                                                );
                                                _player.play();
                                                if(data.currentLevelHard != 13){
                                                  setState(() {
                                                    data.currentLevelHard +=1;
                                                  });
                                                }else if(data.currentLevelHard == 13){
                                                  Navigator.of(context).pop();
                                                }
                                                data.levelLockHard();
                                              },
                                              child: Image(image: AssetImage(cleaningImagesList[data.currentLevelHard]),width: 120,)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const SizedBox(height: 100,),
                                          InkWell(
                                              onTap: (){
                                                _player.setFilePath(
                                                    'assets/sounds/incorrect_answer.mp3');
                                                _player.play();
                                              },
                                              child: Image(image: AssetImage(cleaningImagesList[imageIndexList![whichImage2!]]),width: 120,)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          InkWell(
                                              onTap: (){
                                                _player.setFilePath(
                                                    'assets/sounds/incorrect_answer.mp3');
                                                _player.play();
                                              },
                                              child: Image(image: AssetImage(cleaningImagesList[imageIndexList![whichImage!]]),width: 120,)),
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
                                          InkWell(
                                              onTap: (){
                                                _player.setFilePath(
                                                    'assets/sounds/incorrect_answer.mp3');
                                                _player.play();
                                              },
                                              child: Image(image: AssetImage(cleaningImagesList[imageIndexList![whichImage!]]),width: 120,)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const SizedBox(height: 100,),
                                          InkWell(
                                              onTap: (){
                                                _player.setFilePath(
                                                    'assets/sounds/incorrect_answer.mp3');
                                                _player.play();
                                              },
                                              child: Image(image: AssetImage(cleaningImagesList[imageIndexList![whichImage2!]]),width: 120,)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          InkWell(
                                              onTap: (){
                                                _player.setFilePath(
                                                    'assets/sounds/correct_answer.mp3'
                                                );
                                                _player.play();
                                                if(data.currentLevelHard != 13){
                                                  setState(() {
                                                    data.currentLevelHard +=1;
                                                  });
                                                }else if(data.currentLevelHard == 13){
                                                  Navigator.of(context).pop();
                                                }
                                                data.levelLockHard();
                                              },
                                              child: Image(image: AssetImage(cleaningImagesList[data.currentLevelHard]),width: 120,)),
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