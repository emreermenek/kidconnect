import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../constants/colors.dart';
import '../../biger_or_lower_game/data/numbers.dart';
import '../../shape_match_game/data/offset.dart';
import 'data/marks.dart';
import 'services/data_service.dart';

class NumberChooseCorrectGame extends ConsumerStatefulWidget {
  const NumberChooseCorrectGame({Key? key}) : super(key: key);

  @override
  ConsumerState<NumberChooseCorrectGame> createState() => _NumberChooseCorrectGameState();
}

class _NumberChooseCorrectGameState extends ConsumerState<NumberChooseCorrectGame> {
  int? number1Value;
  int? number2Value;
  int? number3Value;
  int? number4Value;
  int? number5Value;
  int? number6Value;
  int? mark1Value;
  final _player = AudioPlayer();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }

  int randomNumberGenerator() {
    return Random().nextInt(10);
  }
  int randomMarkNumberGenerator(){
    return Random().nextInt(3);
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(dataServiceProvider);
    final ValueNotifier<int> levels= ValueNotifier<int>(data.currentLevel);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 85),
            child: Center(
              child: Image(image: AssetImage('assets/images/choose_correct_games/number_choose_correct_images/background.png'),),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: levels,
            builder: (BuildContext context, value, Widget? child) {
              number1Value = randomNumberGenerator();
              number2Value = randomNumberGenerator();
              number3Value = randomNumberGenerator();
              number4Value = randomNumberGenerator();
              number5Value = randomNumberGenerator();
              number6Value = randomNumberGenerator();
              return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 85),
              child: SingleChildScrollView(
                child: Column(
                  children:
                  [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                              child: const Image(image: AssetImage('assets/images/choose_correct_games/number_choose_correct_images/geri button.png'))),
                          Text('${data.currentLevel +1}/10', style: GoogleFonts.gluten(
                            textStyle:  const TextStyle(
                                color: Color(0xFF16519F),
                                fontSize: 36,
                                fontWeight: FontWeight.bold
                            ),
                          ),)
                        ],
                      ),
                    const SizedBox(height: 5,),
                    const Center(
                      child: Image(image: AssetImage('assets/images/choose_correct_games/number_choose_correct_images/tiger_looking_down.png')),
                    ),
                    /*
                      ---------------------------------------------------------------
                                            First Container
                      ---------------------------------------------------------------
                    */
                    InkWell(
                      onTap: () {
                        if(data.currentLevel == 1 || data.currentLevel == 3 || data.currentLevel == 5 || data.currentLevel == 6 )
                          {
                            _player.setFilePath(
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
                          _player.setFilePath(
                              'assets/sounds/incorrect_answer.mp3');
                          _player.play();
                        }
                      },
                      child: Container(
                        width: 340,
                        height: 122,
                        decoration: BoxDecoration(
                          color: tWhiteColor,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(6),
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                borderRadius: BorderRadius.circular(24)
                              ),
                              child: ValueListenableBuilder(
                                  valueListenable: levels,
                                  builder: (context, value, child) {
                                    number1Value = randomNumberGenerator();
                                    if(data.currentLevel == 1 || data.currentLevel == 3 || data.currentLevel == 5 || data.currentLevel == 6 )
                                    {
                                      return Image(image: AssetImage(
                                          numberImages[levelInfo[data.currentLevel][0]]
                                      ),);

                                    }else{
                                      return Image(image: AssetImage(
                                          numberImages[number1Value!]
                                      ),);
                                    }
                                  }
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(6),
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24)
                              ),
                              child: ValueListenableBuilder(
                                  valueListenable: levels,
                                  builder: (context, value, child) {
                                    if(data.currentLevel == 1 || data.currentLevel == 3 || data.currentLevel == 5 || data.currentLevel == 6 )
                                    {
                                      return Image(image: AssetImage(
                                          markImages[levelInfo[data.currentLevel][1]]
                                      ),);
                                    }else{
                                      if(number1Value! < number2Value!){
                                        return Image(image: AssetImage(
                                            markImages[Random().nextInt(2)]
                                        ),);
                                      }else if(number1Value! == number2Value!){
                                        return Image(image: AssetImage(
                                            markImages[Random().nextInt(2)+1]
                                        ),);
                                      }else{
                                        return Image(image: AssetImage(
                                            markImages[Random().nextInt(2)*2]
                                        ),);
                                      }
                                    }
                                  }
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(6),
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24)
                              ),
                              child: ValueListenableBuilder(
                                  valueListenable: levels,
                                  builder: (context, value, child) {
                                    if(data.currentLevel == 1 || data.currentLevel == 3 || data.currentLevel == 5 || data.currentLevel == 6 )
                                    {
                                      return Image(image: AssetImage(
                                          numberImages[levelInfo[data.currentLevel][2]]
                                      ),);
                                    }else{
                                      return Image(image: AssetImage(
                                          numberImages[number2Value!]
                                      ),);
                                    }
                                  }
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    /*
                      ---------------------------------------------------------------
                                            Second Container
                      ---------------------------------------------------------------
                    */
                    InkWell(
                      onTap: () {
                        if(data.currentLevel == 0 || data.currentLevel == 2 || data.currentLevel == 7)
                        {
                          _player.setFilePath(
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
                          _player.setFilePath(
                              'assets/sounds/incorrect_answer.mp3');
                          _player.play();
                        }
                      },
                      child: Container(

                        width: 340,
                        height: 122,
                        decoration: BoxDecoration(
                          color: tWhiteColor,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(6),
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24)
                              ),
                              child: ValueListenableBuilder(
                                  valueListenable: levels,
                                  builder: (context, value, child) {
                                    if(data.currentLevel == 0 || data.currentLevel == 2 || data.currentLevel == 7 )
                                    {
                                      return Image(image: AssetImage(
                                          numberImages[levelInfo[data.currentLevel][0]]
                                      ),);
                                    }else{
                                      return Image(image: AssetImage(
                                          numberImages[number3Value!]
                                      ),);
                                    }
                                  }
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(6),
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24)
                              ),
                              child: ValueListenableBuilder(
                                  valueListenable: levels,
                                  builder: (context, value, child) {
                                    if(data.currentLevel == 0 || data.currentLevel == 2 || data.currentLevel == 7 )
                                    {
                                      return Image(image: AssetImage(
                                          markImages[levelInfo[data.currentLevel][1]]
                                      ),);
                                    }else{
                                      if(number3Value! < number4Value!){
                                        return Image(image: AssetImage(
                                            markImages[Random().nextInt(2)]
                                        ),);
                                      }else if(number3Value! == number4Value!){
                                        return Image(image: AssetImage(
                                            markImages[Random().nextInt(2)+1]
                                        ),);
                                      }else{
                                        return Image(image: AssetImage(
                                            markImages[Random().nextInt(2)*2]
                                        ),);
                                      }
                                    }
                                  }
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(6),
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24)
                              ),
                              child: ValueListenableBuilder(
                                  valueListenable: levels,
                                  builder: (context, value, child) {
                                    if(data.currentLevel == 0 || data.currentLevel == 2 || data.currentLevel == 7 )
                                    {
                                      return Image(image: AssetImage(
                                          numberImages[levelInfo[data.currentLevel][2]]
                                      ),);
                                    }else{
                                      return Image(image: AssetImage(
                                          numberImages[number4Value!]
                                      ),);
                                    }
                                  }
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    /*
                      ---------------------------------------------------------------
                                            Third Container
                      ---------------------------------------------------------------
                    */
                    InkWell(
                      onTap: () {
                        if(data.currentLevel == 4 || data.currentLevel == 8 || data.currentLevel == 9)
                        {
                          _player.setFilePath(
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
                          _player.setFilePath(
                              'assets/sounds/incorrect_answer.mp3');
                          _player.play();
                        }
                      },
                      child: Container(

                        width: 340,
                        height: 122,
                        decoration: BoxDecoration(
                          color: tWhiteColor,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(6),
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24)
                              ),
                              child: ValueListenableBuilder(
                                  valueListenable: levels,
                                  builder: (context, value, child) {
                                    if(data.currentLevel == 4 || data.currentLevel == 8 || data.currentLevel == 9 )
                                    {
                                      return Image(image: AssetImage(
                                          numberImages[levelInfo[data.currentLevel][0]]
                                      ),);
                                    }else{
                                      return Image(image: AssetImage(
                                          numberImages[number5Value!]
                                      ),);
                                    }
                                  }
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(6),
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24)
                              ),
                              child: ValueListenableBuilder(
                                  valueListenable: levels,
                                  builder: (context, value, child) {
                                    if(data.currentLevel == 4 || data.currentLevel == 8 || data.currentLevel == 9 )
                                    {
                                      return Image(image: AssetImage(
                                          markImages[levelInfo[data.currentLevel][1]]
                                      ),);
                                    }else{
                                      if(number5Value! < number6Value!){
                                        return Image(image: AssetImage(
                                            markImages[Random().nextInt(2)]
                                        ),);
                                      }else if(number5Value! == number6Value!){
                                        return Image(image: AssetImage(
                                            markImages[Random().nextInt(2)+1]
                                        ),);
                                      }else{
                                        return Image(image: AssetImage(
                                            markImages[Random().nextInt(2)*2]
                                        ),);
                                      }
                                    }
                                  }
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(6),
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24)
                              ),
                              child: ValueListenableBuilder(
                                  valueListenable: levels,
                                  builder: (context, value, child) {
                                    if(data.currentLevel == 4 || data.currentLevel == 8 || data.currentLevel == 9 )
                                    {
                                      return Image(image: AssetImage(
                                          numberImages[levelInfo[data.currentLevel][2]]
                                      ),);
                                    }else{
                                      return Image(image: AssetImage(
                                          numberImages[number6Value!]
                                      ),);
                                    }
                                  }
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Text('doğru olan\nifadeye tıkla',style: GoogleFonts.gluten(
                      textStyle:  const TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold
                      ),
                    ),),
                  ],
                ),
              ),
            );
            }
          ),
        ],
      ),
    );
  }
}
