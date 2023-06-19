import 'package:bootcamp_f32/common_widgets/alert_dialog_fail.dart';
import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/shape_match_game/shape_match_game/difficulty_widget.dart';
import 'package:bootcamp_f32/features/app/shape_match_game/shape_match_game/painter.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import '../../../../common_widgets/alert_dialog_success.dart';
import '../data/answer.dart';
import '../data/offset.dart';
import '../common_features/text_to_speech.dart';
import '../data/shape_location.dart';
import '../data/shape_names.dart';
import '../data/sound_level.dart';
import '../services/data_change_notifier.dart';



class MatchImage extends ConsumerStatefulWidget {
  const MatchImage({Key? key}) : super(key: key);

  @override
  ConsumerState<MatchImage> createState() => _MatchImageState();
}

bool isFirstTrue = false;
bool isSecondTrue = false;
bool isThirdTrue = false;

class _MatchImageState extends ConsumerState<MatchImage> {


  bool isVolumeOn = true;

  final player = AudioPlayer();
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerCenter = ConfettiController(duration: const Duration(seconds: 3));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerCenter.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dataRepo = ref.watch(dataChangeNotifierProvider);
    final ValueNotifier<int> levels = ValueNotifier<int>(dataRepo.currentLevel);
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: levels,
        builder: (BuildContext context, value, Widget? child) => Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/image_match/background/background_ucgen.png'),
                  fit: BoxFit.fill
              ),

            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DifficultyWidget(dataRepo: dataRepo),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar(
                          minRating: 0,
                          maxRating: 3,
                          initialRating: dataRepo.healthes,
                          itemCount: 3,
                          allowHalfRating: false,
                          ignoreGestures: true,
                          ratingWidget: RatingWidget(
                            full: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            half: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            empty: const Icon(
                              Icons.favorite,
                              color: Colors.grey,
                            ),
                          ),
                          onRatingUpdate: (value) {
                            setState(() {
                              dataRepo.healthes = value;
                            });

                          },
                        ),
                        const SizedBox(width: 20,),
                        Text('Skor: ${dataRepo.points}/3',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                        const SizedBox(width: 40,),
                        IconButton(
                            onPressed: ()
                            {
                              setState(() {
                                isVolumeOn = !isVolumeOn;
                              });
                            },
                            iconSize: 30,
                            icon: isVolumeOn ? const Icon(Icons.volume_up) : const Icon(Icons.volume_off)
                        ),
                      ],
                    ),

                    Container(
                        height: 490,
                        width: 320,
                        decoration: BoxDecoration(
                            color: tWhiteColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 6,
                                color: tErrorColor
                            ),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: Colors.grey.shade500,
                                  offset: const Offset(
                                      3,
                                      6
                                  )
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15,top:25),
                              child: CustomPaint(
                                painter: LinePainter(
                                  firstStartPoint: dataRepo.firstStartPoint, firstEndPoint: dataRepo.firstEndPoint,
                                  secondStartPoint: dataRepo.secondStartPoint, secondEndPoint: dataRepo.secondEndPoint,
                                  thirdStartPoint: dataRepo.thirdStartPoint, thirdEndPoint: dataRepo.thirdEndPoint,
                                  currentLevel: dataRepo.currentLevel, isFirstClicked: dataRepo.isFirstClicked,
                                  isSecondClicked: dataRepo.isSecondClicked, isThirdClicked: dataRepo.isThirdClicked,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                            onLongPress: () {
                                              if(isVolumeOn == true){
                                                textToSpeech(shapeNames[dataRepo.currentLevel][0]);
                                              }
                                            },
                                            onTap: () {

                                              setState(() {
                                                dataRepo.firstStartPoint = leftDots[0];
                                                dataRepo.isFirstClicked=true;
                                                dataRepo.isSecondClicked = false;
                                                dataRepo.isThirdClicked = false;

                                              });

                                            },
                                            child: Image(image: AssetImage(shapeLocation[dataRepo.currentLevel][0]),width: 100,)
                                        ),
                                        const SizedBox(width: 75,),
                                        InkWell(
                                            onLongPress: () {
                                              if(isVolumeOn == true){
                                                textToSpeech(shapeNames[dataRepo.currentLevel][1]);
                                              }

                                            },
                                            onTap: (){

                                              setState(() {

                                                if(isFirstTrue==false && dataRepo.isFirstClicked == true){
                                                  dataRepo.firstEndPoint = rightDots[0];
                                                  dataRepo.isFirstClicked = false;
                                                  answer(soundByLevel[dataRepo.currentLevel][0],dataRepo);
                                                }
                                                if(isSecondTrue == false && dataRepo.isSecondClicked == true){
                                                  dataRepo.secondEndPoint = rightDots[0];
                                                  dataRepo.isSecondClicked = false;
                                                  answer(soundByLevel[dataRepo.currentLevel][1],dataRepo);
                                                }
                                                if(isThirdTrue == false && dataRepo.isThirdClicked == true){
                                                  dataRepo.thirdEndPoint = rightDots[0];
                                                  dataRepo.isThirdClicked = false;
                                                  answer(soundByLevel[dataRepo.currentLevel][2],dataRepo);
                                                }

                                              });
                                            },
                                            child: Image(image: AssetImage(shapeLocation[dataRepo.currentLevel][1]),width: 100,)
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 60,),
                                    Row(
                                      children: [
                                        InkWell(
                                            onLongPress: () {
                                              if(isVolumeOn == true){
                                                textToSpeech(shapeNames[dataRepo.currentLevel][2]);
                                              }

                                            },
                                            onTap: (){

                                              setState(() {
                                                dataRepo.secondStartPoint = leftDots[1];
                                                dataRepo.isSecondClicked = true;
                                                dataRepo.isFirstClicked = false;
                                                dataRepo.isThirdClicked = false;
                                              });

                                            },
                                            child: Image(image: AssetImage(shapeLocation[dataRepo.currentLevel][2]),width: 100)
                                        ),
                                        const SizedBox(width: 75,),
                                        InkWell(
                                            onLongPress: () {
                                              if(isVolumeOn == true){
                                                textToSpeech(shapeNames[dataRepo.currentLevel][3]);
                                              }

                                            },
                                            onTap: (){
                                              setState(() {
                                                if(isFirstTrue==false && dataRepo.isFirstClicked == true) {
                                                  dataRepo.firstEndPoint = rightDots[1];
                                                  dataRepo.isFirstClicked = false;
                                                  answer(soundByLevel[dataRepo.currentLevel][3],dataRepo);
                                                }
                                                if(isSecondTrue == false && dataRepo.isSecondClicked == true) {
                                                  dataRepo.secondEndPoint = rightDots[1];
                                                  dataRepo.isSecondClicked = false;
                                                  answer(soundByLevel[dataRepo.currentLevel][4],dataRepo);
                                                }
                                                if(isThirdTrue == false && dataRepo.isThirdClicked == true){
                                                  dataRepo.thirdEndPoint = rightDots[1];
                                                  dataRepo.isThirdClicked = false;
                                                  answer(soundByLevel[dataRepo.currentLevel][5],dataRepo);
                                                }

                                              });
                                            },
                                            child: Image(image: AssetImage(shapeLocation[dataRepo.currentLevel][3]),width: 100)
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 60,),
                                    Row(
                                      children: [
                                        InkWell(
                                            onLongPress: () {
                                              if(isVolumeOn == true){
                                                textToSpeech(shapeNames[dataRepo.currentLevel][4]);
                                              }

                                            },
                                            onTap: (){
                                              setState(() {
                                                dataRepo.thirdStartPoint = leftDots[2];
                                                dataRepo.isThirdClicked = true;
                                                dataRepo.isFirstClicked = false;
                                                dataRepo.isSecondClicked = false;
                                              });

                                            },
                                            child: Image(image: AssetImage(shapeLocation[dataRepo.currentLevel][4]),width: 100)
                                        ),
                                        const SizedBox(width: 75,),
                                        InkWell(
                                            onLongPress: () {
                                              if(isVolumeOn == true){
                                                textToSpeech(shapeNames[dataRepo.currentLevel][5]);
                                              }

                                            },
                                            onTap: (){
                                              setState(() {
                                                if(isFirstTrue==false && dataRepo.isFirstClicked == true) {
                                                  dataRepo.firstEndPoint = rightDots[2];
                                                  dataRepo.isFirstClicked = false;
                                                  answer(soundByLevel[dataRepo.currentLevel][6],dataRepo);
                                                }
                                                if(isSecondTrue == false && dataRepo.isSecondClicked == true) {
                                                  dataRepo.secondEndPoint = rightDots[2];
                                                  dataRepo.isSecondClicked = false;
                                                  answer(soundByLevel[dataRepo.currentLevel][7],dataRepo);
                                                }
                                                if(isThirdTrue == false && dataRepo.isThirdClicked == true){
                                                  dataRepo.thirdEndPoint = rightDots[2];
                                                  dataRepo.isThirdClicked = false;
                                                  answer(soundByLevel[dataRepo.currentLevel][8],dataRepo);
                                                }

                                              });
                                            },
                                            child: Image(image: AssetImage(shapeLocation[dataRepo.currentLevel][5]),width: 100)
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),


                          ],
                        )
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            dataRepo.resetGame();
                            isFirstTrue = false;
                            isSecondTrue = false;
                            isThirdTrue = false;
                          },
                          child: Image.asset('assets/images/image_match/background/btn geri.png',width: 60,),
                        ),
                        const SizedBox(width: 10,),
                        InkWell(
                          onTap: () {
                            dataRepo.resetGame();
                            isFirstTrue = false;
                            isSecondTrue = false;
                            isThirdTrue = false;
                          },
                          child: Image.asset('assets/images/image_match/background/btn sıfırla.png',width: 60,),
                        ),
                        const SizedBox(width: 10,),
                        InkWell(
                          onTap: () {

                          },
                          child: Image.asset('assets/images/image_match/background/btn soru işrati.png',width: 60,),
                        ),
                      ],
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: ConfettiWidget(
                    confettiController: _controllerCenter,
                    blastDirectionality: BlastDirectionality
                        .explosive,
                    maxBlastForce: 30,
                    numberOfParticles: 20,
                    shouldLoop:
                    false,
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                      Colors.purple
                    ],
                  ),
                ),
                FutureBuilder(
                    future: isCorrect(dataRepo.finished),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.data == true) {
                        return AlertDialogFail(dataRepo: dataRepo);
                      }else if(snapshot.data == false){
                        return AlertDialogSuccess(dataRepo: dataRepo);
                      }else{
                        return const SizedBox.shrink();
                      }

                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void answer(bool isCorrect,DataChangeNotifier dataRepo){
    if(isCorrect){
      dataRepo.points += 1;
      if(dataRepo.points==3){
        _controllerCenter.play();
        player.setFilePath(
            'assets/sounds/confetti_sound.mp3');
        player.play();
        dataRepo.finished = true;
      }else{
        if(isVolumeOn == true) {
          player.setFilePath(
              'assets/sounds/correct_answer.mp3'
          );
          player.play();

        }
      }
    } else{
      dataRepo.healthes -=1;
      if(dataRepo.healthes == 0){
        dataRepo.finished = false;
      }else{
        if(isVolumeOn == true) {
          player.setFilePath(
              'assets/sounds/incorrect_answer.mp3');
          player.play();
        }

      }
    }
  }
}








