import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'data/data.dart';
import 'services/services.dart';

class BodyMakeLogicGame extends ConsumerStatefulWidget {
  const BodyMakeLogicGame({super.key});

  @override
  ConsumerState<BodyMakeLogicGame> createState() => _BodyMakeLogicGameState();
}

class _BodyMakeLogicGameState extends ConsumerState<BodyMakeLogicGame> {
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
    final data = ref.watch(bodyMakeLogicGameServiceProvider);
    final ValueNotifier<int> levels = ValueNotifier<int>(data.currentLevel);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F0D7),
        body: ValueListenableBuilder(
            valueListenable: levels,
            builder: (BuildContext context, int value, Widget? child) {
              a = Random().nextInt(3);
              imageIndexList = List.generate(13, (index) => index);
              imageIndexList!.removeAt(data.currentLevel);
              whichImage = Random().nextInt(12);
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
                          Text('${data.currentLevel+1}/13',
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
                        Image(image: AssetImage(bodyMakeLogicGameImages[data.currentLevel])),
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
                                        InkWell(
                                            onTap: (){
                                              if(data.currentLevel != 12){
                                                setState(() {
                                                  data.currentLevel +=1;
                                                });
                                                _player.setAsset(
                                                    'assets/sounds/correct_answer.mp3'
                                                );
                                                _player.play();
                                              }else if(data.currentLevel == 12){
                                                Navigator.of(context).pop();
                                              }
                                              data.levelLock();
                                            },
                                            child: Image(image: AssetImage(bodyImagesList[data.currentLevel]),width: 150)),
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
                                            child: Image(image: AssetImage(bodyImagesList[imageIndexList![whichImage!]]),width: 150)),
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
                                            child: Image(image: AssetImage(bodyImagesList[imageIndexList![whichImage!]]),width: 150)),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const SizedBox(height: 100,),
                                        InkWell(
                                            onTap: (){

                                              if(data.currentLevel != 12){
                                                setState(() {
                                                  data.currentLevel +=1;
                                                });
                                                _player.setAsset(
                                                    'assets/sounds/correct_answer.mp3'
                                                );
                                                _player.play();
                                              }else if(data.currentLevel == 12){
                                                Navigator.of(context).pop();
                                              }
                                              data.levelLock();
                                            },
                                            child: Image(image: AssetImage(bodyImagesList[data.currentLevel]),width: 150)),
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
                                            child: Image(image: AssetImage(bodyImagesList[imageIndexList![whichImage!]]),width: 150)),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                            onTap: (){

                                              if(data.currentLevel != 12){
                                                setState(() {
                                                  data.currentLevel +=1;
                                                });
                                                _player.setAsset(
                                                    'assets/sounds/correct_answer.mp3'
                                                );
                                                _player.play();
                                              }else if(data.currentLevel == 12){
                                                Navigator.of(context).pop();
                                              }
                                              data.levelLock();
                                            },
                                            child: Image(image: AssetImage(bodyImagesList[data.currentLevel]),width: 150)),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }

                          },
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
