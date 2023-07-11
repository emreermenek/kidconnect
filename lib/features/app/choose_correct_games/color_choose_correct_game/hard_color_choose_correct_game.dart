import 'dart:math';

import 'package:bootcamp_f32/features/app/choose_correct_games/color_choose_correct_game/data/easy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'services/services.dart';

class HardColorChooseCorrectGame extends ConsumerStatefulWidget {
  const HardColorChooseCorrectGame({Key? key}) : super(key: key);

  @override
  ConsumerState<HardColorChooseCorrectGame> createState() =>
      _HardColorChooseCorrectGameState();
}

class _HardColorChooseCorrectGameState
    extends ConsumerState<HardColorChooseCorrectGame> {

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
    final data = ref.watch(colorChooseCorrectGameServiceProvider);
    final ValueNotifier<int> levels = ValueNotifier<int>(data.currentLevelHard);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFEACE),
        body: SizedBox(
          height: double.infinity,
          child: ValueListenableBuilder(
              valueListenable: levels,
              builder: (BuildContext context, value, Widget? child) {
                a = Random().nextInt(3);
                imageIndexList = List.generate(9, (index) => index);
                imageIndexList!.removeAt(data.currentLevelHard);
                whichImage = Random().nextInt(7);
                imageIndexList!.removeAt(whichImage!);
                whichImage2 = Random().nextInt(6);

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
                                SizedBox(width:size.width*0.35),
                                Text('${easyNames[data.currentLevelHard]} renkli\n   balonu\n   bulalım', style: GoogleFonts.comfortaa(
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
                                Text('${data.currentLevelHard+1}/9',
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
                          Column(
                            children: [
                              const SizedBox(height: 30,),
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
                                                    _player.setAsset(
                                                        'assets/sounds/incorrect_answer.mp3');
                                                    _player.play();
                                                  },
                                                  child: Image(image: AssetImage(easyImages[imageIndexList![whichImage!]]),width: 120,)),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              InkWell(
                                                  onTap: (){
                                                    _player.setAsset(
                                                        'assets/sounds/correct_answer.mp3'
                                                    );
                                                    _player.play();
                                                    if(data.currentLevelHard != 8){
                                                      setState(() {
                                                        data.currentLevelHard +=1;
                                                      });
                                                    }else if(data.currentLevelHard == 8){
                                                      Navigator.of(context).pop();
                                                    }
                                                    data.levelLockHard();
                                                  },
                                                  child: Image(image: AssetImage(easyImages[data.currentLevelHard]),width: 120,)),
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
                                                  child: Image(image: AssetImage(easyImages[imageIndexList![whichImage2!]]),width: 120,)),
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
                                                        'assets/sounds/correct_answer.mp3'
                                                    );
                                                    _player.play();
                                                    if(data.currentLevelHard != 8){
                                                      setState(() {
                                                        data.currentLevelHard +=1;
                                                      });
                                                    }else if(data.currentLevelHard == 8){
                                                      Navigator.of(context).pop();
                                                    }
                                                    data.levelLockHard();
                                                  },
                                                  child: Image(image: AssetImage(easyImages[data.currentLevelHard]),width: 120,)),
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
                                                  child: Image(image: AssetImage(easyImages[imageIndexList![whichImage2!]]),width: 120,)),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              InkWell(
                                                  onTap: (){
                                                    _player.setAsset(
                                                        'assets/sounds/incorrect_answer.mp3');
                                                    _player.play();
                                                  },
                                                  child: Image(image: AssetImage(easyImages[imageIndexList![whichImage!]]),width: 120,)),
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
                                                    _player.setAsset(
                                                        'assets/sounds/incorrect_answer.mp3');
                                                    _player.play();
                                                  },
                                                  child: Image(image: AssetImage(easyImages[imageIndexList![whichImage!]]),width: 120,)),
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
                                                  child: Image(image: AssetImage(easyImages[imageIndexList![whichImage2!]]),width: 120,)),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              InkWell(
                                                  onTap: (){
                                                    _player.setAsset(
                                                        'assets/sounds/correct_answer.mp3'
                                                    );
                                                    _player.play();
                                                    if(data.currentLevelHard != 8){
                                                      setState(() {
                                                        data.currentLevelHard +=1;
                                                      });
                                                    }else if(data.currentLevelHard == 8){
                                                      Navigator.of(context).pop();
                                                    }
                                                    data.levelLockHard();
                                                  },
                                                  child: Image(image: AssetImage(easyImages[data.currentLevelHard]),width: 120,)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }

                                },
                              ),
                            ],
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