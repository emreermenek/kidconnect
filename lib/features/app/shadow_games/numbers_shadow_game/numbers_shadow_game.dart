import 'package:bootcamp_f32/features/app/shadow_games/numbers_shadow_game/data/data.dart';
import 'package:bootcamp_f32/features/app/shadow_games/numbers_shadow_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class NumberShadowGame extends ConsumerStatefulWidget {
  const NumberShadowGame({super.key});

  @override
  ConsumerState<NumberShadowGame> createState() => _NumberShadowGameState();
}

class _NumberShadowGameState extends ConsumerState<NumberShadowGame> {

  int firstIndex =0;
  int secondIndex=0;
  int thirdIndex=0;

  final _player = AudioPlayer();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(numberShadowGameDataServiceProvider);
    final ValueNotifier<int> levels = ValueNotifier<int>(data.currentLevel);

    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: levels,
          builder: (BuildContext context, value, Widget? child) {
            try{
              // Shuffle the list of indices
              data.imageIndexList.shuffle();
              // Select the first three elements as the random indices
              firstIndex = data.imageIndexList[0];
              secondIndex = data.imageIndexList[1];
              thirdIndex = data.imageIndexList[2];
              // Remove the selected elements from the list
              data.imageIndexList.removeRange(0, 3);
            }catch(e){
              print(e);
            }
          return Stack(
            children: [
              const Align(
                alignment: Alignment.bottomLeft,
                child: Image(
                  image: AssetImage(
                      'assets/images/shadow_games/background/bottom_left_background.png'),
                ),
              ),
              const Align(
                alignment: Alignment.bottomRight,
                child: Image(
                  image: AssetImage(
                      'assets/images/shadow_games/background/bottom_right_background.png'),
                ),
              ),
              const Positioned(
                left: 0,
                bottom: 220,
                child: Image(
                  image: AssetImage(
                      'assets/images/shadow_games/background/left_background.png'),
                ),
              ),
              const Positioned(
                right: 0,
                bottom: 220,
                child: Image(
                  image: AssetImage(
                      'assets/images/shadow_games/background/right_background.png'),
                ),
              ),
              /*
              ------------------------
                      column
              ------------------------
              */
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 400,),
                    SizedBox(
                      height: 300,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Draggable<int>(
                                data: secondIndex,
                                feedback:  Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(numberShadowGameImage[secondIndex])
                                      )
                                  ),
                                ),
                                childWhenDragging: Image(
                                  image: AssetImage(numberShadowGameImage[secondIndex]),
                                  color: Colors.grey,
                                  width: 100,
                                  height: 100,
                                ),
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(numberShadowGameImage[secondIndex])
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Draggable<int>(
                                data: firstIndex,
                                feedback:  Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(numberShadowGameImage[firstIndex])
                                      )
                                  ),
                                ),
                                childWhenDragging: Image(
                                  image: AssetImage(numberShadowGameImage[firstIndex]),
                                  color: Colors.grey,
                                  width: 100,
                                  height: 100,
                                ),
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(numberShadowGameImage[firstIndex])
                                      )
                                  ),
                                ),
                              ),
                              Draggable<int>(
                                data: thirdIndex,
                                feedback:  Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(numberShadowGameImage[thirdIndex])
                                      )
                                  ),
                                ),
                                childWhenDragging: Image(
                                  image: AssetImage(numberShadowGameImage[thirdIndex]),
                                  color: Colors.grey,
                                  width: 100,
                                  height: 100,
                                ),
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(numberShadowGameImage[thirdIndex])
                                      )
                                  ),
                                ),
                              ),
                            ],

                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 325,
                      decoration: const BoxDecoration(
                          color: Color(0xFFD27070),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(24),
                          )
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 150,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DragTarget<int>(
                                builder: (BuildContext context, List<int?> candidateData, List<dynamic> rejectedData) => candidateData.isEmpty ? Image(
                                  image: AssetImage(numberShadowGameImage[firstIndex]),
                                  color: Colors.grey,
                                  width: 100,
                                  height: 100,
                                ) : Image(
                                  image: AssetImage(numberShadowGameImage[firstIndex]),
                                  color: null,
                                  width: 100,
                                  height: 100,
                                ),
                                onWillAccept: (input) {
                                  if(input == firstIndex){
                                    return true;
                                  }else{
                                    _player.setFilePath(
                                        'assets/sounds/incorrect_answer.mp3');
                                    _player.play();
                                    return false;
                                  }
                                },
                                onAccept: (input) {
                                    if(data.correctAnswerNumber != 2){
                                        _player.setFilePath(
                                            'assets/sounds/correct_answer.mp3'
                                        );
                                        _player.play();
                                        data.correctAnswerNumber +=1;
                                    }else{

                                      _player.setFilePath(
                                          'assets/sounds/correct_answer.mp3'
                                      );
                                      _player.play();
                                      data.levelLock();
                                      setState(() {
                                        data.currentLevel += 1;
                                        data.correctAnswerNumber = 0;
                                      });
                                    }
                                },
                              ),
                              DragTarget<int>(
                                builder: (BuildContext context, List<int?> candidateData, List<dynamic> rejectedData) =>Image(
                                  image: AssetImage(numberShadowGameImage[secondIndex]),
                                  color: candidateData.isEmpty ? Colors.grey : null,
                                  width: 100,
                                  height: 100,
                                ),
                                onWillAccept: (input) {
                                  if(input == secondIndex){
                                    return true;
                                  }else{
                                    _player.setFilePath(
                                        'assets/sounds/incorrect_answer.mp3');
                                    _player.play();
                                    return false;
                                  }
                                },
                                onAccept: (input) {

                                  if(data.correctAnswerNumber != 2){
                                    _player.setFilePath(
                                        'assets/sounds/correct_answer.mp3'
                                    );
                                    _player.play();
                                      data.correctAnswerNumber +=1;
                                  }else{

                                    _player.setFilePath(
                                        'assets/sounds/correct_answer.mp3'
                                    );
                                    _player.play();
                                    data.levelLock();
                                    setState(() {
                                      data.currentLevel += 1;
                                      data.correctAnswerNumber = 0;
                                    });
                                  }
                                },
                              ),
                              DragTarget<int>(
                                builder: (BuildContext context, List<int?> candidateData, List<dynamic> rejectedData) =>Image(
                                  image: AssetImage(numberShadowGameImage[thirdIndex]),
                                  color: candidateData.isEmpty ? Colors.grey : null,
                                  width: 100,
                                  height: 100,
                                ),
                                onWillAccept: (input) {
                                  if(input == thirdIndex){
                                    return true;
                                  }else{
                                    _player.setFilePath(
                                        'assets/sounds/incorrect_answer.mp3');
                                    _player.play();
                                    return false;
                                  }
                                },
                                onAccept: (input) {
                                  if(data.correctAnswerNumber != 2){
                                    _player.setFilePath(
                                        'assets/sounds/correct_answer.mp3'
                                    );
                                    _player.play();

                                      data.correctAnswerNumber +=1;

                                  }else{

                                    _player.setFilePath(
                                        'assets/sounds/correct_answer.mp3'
                                    );
                                    _player.play();
                                    data.levelLock();
                                    setState(() {
                                      data.currentLevel += 1;
                                      data.correctAnswerNumber = 0;
                                    });
                                  }
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              /*
              ------------------------
                      column
              ------------------------
              */

              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Image(
                        image: AssetImage(
                            'assets/images/shadow_games/background/exit_button.png'),
                      )),
                ),
              ),
              const Positioned(
                  top: 10,
                  right: 10,
                  child: Image(
                      image: AssetImage(
                          'assets/images/shadow_games/background/tiger_looking_down.png'))),
              Column(
                children: [
                  const SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '            HADİ!\nGÖLGESİNİ BULALIM',
                        style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
  }
        ),
      ),
    );
  }
}