import 'package:bootcamp_f32/features/app/clock_game/part_of_days/data/data.dart';
import 'package:bootcamp_f32/features/app/clock_game/part_of_days/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class PartOfDaysGame extends ConsumerStatefulWidget {
  const PartOfDaysGame({super.key});

  @override
  ConsumerState<PartOfDaysGame> createState() => _PartOfDaysGameState();
}

class _PartOfDaysGameState extends ConsumerState<PartOfDaysGame> {
  final _player = AudioPlayer();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(partOfDaysGameServiceProvider);
    final ValueNotifier<int> levels = ValueNotifier<int>(data.currentLevel);
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: levels,
        builder: (BuildContext context, int value, Widget? child) { 
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/clock_game/part_of_days/background.png'),
              fit: BoxFit.fill
            )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                          child: const Image(image: AssetImage('assets/images/clock_game/part_of_days/exit.png'))),
                      const SizedBox(width: 70,),
                      Text('Günün Bölümleri', style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        )
                      ),),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(image: AssetImage(partOfDaysImages[data.currentLevel])),
                    Text(partOfDaysClockNames[data.currentLevel], style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      )
                    ),),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        if(partOfDaysAnswer[data.currentLevel] == 0){
                          if(data.currentLevel == 5){
                            Navigator.of(context).pop();
                          }else{
                            setState(() {
                              data.currentLevel +=1;
                            });
                            _player.setAsset(
                                'assets/sounds/correct_answer.mp3'
                            );
                            _player.play();
                            data.levelLock();
                          }
                        }else{
                          _player.setAsset(
                              'assets/sounds/incorrect_answer.mp3');
                          _player.play();
                        }
                      },
                        child: Image(image: AssetImage(partOfDaysClockImages[data.currentLevel][0]))
                    ),
                    const SizedBox(height: 10,),
                    InkWell(
                        onTap: () {
                          if(partOfDaysAnswer[data.currentLevel] == 1){
                            if(data.currentLevel == 5){
                              Navigator.of(context).pop();
                            }else{
                              setState(() {
                                data.currentLevel +=1;
                              });
                              _player.setAsset(
                                  'assets/sounds/correct_answer.mp3'
                              );
                              _player.play();
                              data.levelLock();
                            }
                          }else{
                            _player.setAsset(
                                'assets/sounds/incorrect_answer.mp3');
                            _player.play();
                          }
                        },
                        child: Image(image: AssetImage(partOfDaysClockImages[data.currentLevel][1]))
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
