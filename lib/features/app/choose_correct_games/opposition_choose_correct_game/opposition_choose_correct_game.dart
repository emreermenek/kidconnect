import 'package:bootcamp_f32/features/app/choose_correct_games/opposition_choose_correct_game/data/data.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/opposition_choose_correct_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class OppositionChooseCorrectGame extends ConsumerStatefulWidget {
  const OppositionChooseCorrectGame({Key? key}) : super(key: key);

  @override
  ConsumerState<OppositionChooseCorrectGame> createState() =>
      _OppositionChooseCorrectGameState();
}

class _OppositionChooseCorrectGameState
    extends ConsumerState<OppositionChooseCorrectGame> {

  final _player = AudioPlayer();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(oppositionChooseCorrectGameServiceProvider);
    final ValueNotifier<int> levels = ValueNotifier<int>(data.currentLevel);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFEACE),
        body: SizedBox(
          height: double.infinity,
          child: ValueListenableBuilder(
              valueListenable: levels,
              builder: (BuildContext context, value, Widget? child) {
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
                                SizedBox(width:size.width*0.3),
                                Text('Hangisi\n${oppositionNamesList[data.currentLevel]}?', style: GoogleFonts.comfortaa(
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
                                        data.currentLevel = 0;
                                      });
                                    },
                                    child: const Image(image: AssetImage('assets/images/choose_correct_games/color_choose_correct_game_images/exit.png'))
                                ),
                                Text('${data.currentLevel+1}/32',
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
                              const SizedBox(height: 40,),
                              ValueListenableBuilder(
                                valueListenable: levels,
                                builder: (BuildContext context, value, Widget? child) {
                                  if(verticalOrHorizontal[data.currentLevel] == 1){
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                              if(oppositionCorrectAnswer[data.currentLevel] == 1){ //doğru
                                                if(data.currentLevel != 31){
                                                  setState(() {
                                                    data.currentLevel +=1;
                                                  });
                                                  _player.setAsset(
                                                      'assets/sounds/correct_answer.mp3'
                                                  );
                                                  _player.play();
                                                }else if(data.currentLevel == 31){
                                                  Navigator.of(context).pop();
                                                }
                                                data.levelLock();
                                              }else{   //yanlış
                                                _player.setAsset(
                                                    'assets/sounds/incorrect_answer.mp3');
                                                _player.play();
                                              }
                                          },
                                          child: Image(image: AssetImage(oppositionImagesList[data.currentLevel][0]),width: 120,),
                                        ),
                                        const SizedBox(width: 10,),
                                        InkWell(
                                          onTap: () {
                                            if(oppositionCorrectAnswer[data.currentLevel] == 0){ //doğru
                                              if(data.currentLevel != 31){
                                                setState(() {
                                                  data.currentLevel +=1;
                                                });
                                                _player.setAsset(
                                                    'assets/sounds/correct_answer.mp3'
                                                );
                                                _player.play();
                                              }else if(data.currentLevel == 31){
                                                Navigator.of(context).pop();
                                              }
                                              data.levelLock();
                                            }else{   //yanlış
                                              _player.setAsset(
                                                  'assets/sounds/incorrect_answer.mp3');
                                              _player.play();
                                            }
                                          },
                                          child: Image(image: AssetImage(oppositionImagesList[data.currentLevel][1]),width: 120,),
                                        ),
                                      ],
                                    );
                                  }else{
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if(oppositionCorrectAnswer[data.currentLevel] == 1){ //doğru
                                              if(data.currentLevel != 31){
                                                setState(() {
                                                  data.currentLevel +=1;
                                                });
                                                _player.setAsset(
                                                    'assets/sounds/correct_answer.mp3'
                                                );
                                                _player.play();
                                              }else if(data.currentLevel == 31){
                                                Navigator.of(context).pop();
                                              }
                                              data.levelLock();
                                            }else{   //yanlış
                                              _player.setAsset(
                                                  'assets/sounds/incorrect_answer.mp3');
                                              _player.play();
                                            }
                                          },
                                          child: Image(image: AssetImage(oppositionImagesList[data.currentLevel][0]),width: 120),
                                        ),
                                        const SizedBox(height: 20,),
                                        InkWell(
                                          onTap: () {
                                            if(oppositionCorrectAnswer[data.currentLevel] == 0){ //doğru
                                              if(data.currentLevel != 31){
                                                setState(() {
                                                  data.currentLevel +=1;
                                                });
                                                _player.setAsset(
                                                    'assets/sounds/correct_answer.mp3'
                                                );
                                                _player.play();
                                              }else if(data.currentLevel == 31){
                                                Navigator.of(context).pop();
                                              }
                                              data.levelLock();
                                            }else{   //yanlış
                                              _player.setAsset(
                                                  'assets/sounds/incorrect_answer.mp3');
                                              _player.play();
                                            }
                                          },
                                          child: Image(image: AssetImage(oppositionImagesList[data.currentLevel][1]),width: 120,),
                                        ),
                                      ],
                                    );
                                  }

                              }
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