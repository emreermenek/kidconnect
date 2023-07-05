import 'package:bootcamp_f32/features/app/clock_game/time/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import 'services/services.dart';

class ClockGame extends ConsumerStatefulWidget {
  const ClockGame({super.key});

  @override
  ConsumerState<ClockGame> createState() => _ClockGameState();
}

class _ClockGameState extends ConsumerState<ClockGame> {
  final _player = AudioPlayer();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(timesGameServiceProvider);
    final ValueNotifier<int> levels = ValueNotifier<int>(data.currentLevel);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: levels,
        builder: (BuildContext context, int value, Widget? child) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/clock_game/time/background.png'),
              fit: BoxFit.fill
            )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 330,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: const Image(image: AssetImage('assets/images/clock_game/time/exit.png'))),
                        ),
                      ),
                      SizedBox(
                        width: size.width-115,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage(timeImages[data.currentLevel])),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('SAAT KAÇ?', style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        )
                    ),),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        if(timeAnswers[data.currentLevel] == 0){
                          if(data.currentLevel == 5){
                            Navigator.of(context).pop();
                          }else{
                            setState(() {
                              data.currentLevel +=1;
                            });
                            _player.setFilePath(
                                'assets/sounds/correct_answer.mp3'
                            );
                            _player.play();
                            data.levelLock();
                          }
                        }else{
                          _player.setFilePath(
                              'assets/sounds/incorrect_answer.mp3');
                          _player.play();
                        }
                      },
                      child: Container(
                        width: 207,
                        height: 182,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.white
                        ),
                        child: Center(
                          child: Text(timeNames[data.currentLevel][0], style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              )
                          ),),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    InkWell(
                      onTap: () {
                        if(timeAnswers[data.currentLevel] == 1){
                          if(data.currentLevel == 5){
                            Navigator.of(context).pop();
                          }else{
                            setState(() {
                              data.currentLevel +=1;
                            });
                            _player.setFilePath(
                                'assets/sounds/correct_answer.mp3'
                            );
                            _player.play();
                            data.levelLock();
                          }
                        }else{
                          _player.setFilePath(
                              'assets/sounds/incorrect_answer.mp3');
                          _player.play();
                        }
                      },
                      child: Container(
                        width: 207,
                        height: 182,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white
                        ),
                        child: Center(
                          child: Text(timeNames[data.currentLevel][1], style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              )
                          ),),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
  }
      ),
    );
  }
}
