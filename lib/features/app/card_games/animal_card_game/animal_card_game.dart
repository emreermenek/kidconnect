import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/card_games/animal_card_game/data/animals.dart';
import 'package:bootcamp_f32/features/app/card_games/animal_card_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class AnimalCardGame extends ConsumerStatefulWidget {
  const AnimalCardGame({super.key});

  @override
  ConsumerState<AnimalCardGame> createState() => _AnimalCardGameState();
}

class _AnimalCardGameState extends ConsumerState<AnimalCardGame> {
  final _player = AudioPlayer();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(animalCardGameDataServiceProvider);
    final ValueNotifier<int> chooseAnimal = ValueNotifier<int>(data.currentAnimal);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ValueListenableBuilder(
          valueListenable: chooseAnimal,
          builder: (BuildContext context, value, Widget? child) => SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                const Positioned(
                    bottom: 0,
                    right: 40,
                    child: Image(image: AssetImage('assets/images/card_games/animal_card_game_image/left_side_chicken.png'),)
                ),
                const Positioned(
                    bottom: 30,
                    right: 95,
                    child: Image(image: AssetImage('assets/images/card_games/animal_card_game_image/left_side_chicken.png'),)
                ),
                const Positioned(
                    bottom: 0,
                    right: 140,
                    child: Image(image: AssetImage('assets/images/card_games/animal_card_game_image/right_side_chicken.png'),)
                ),
                const Positioned(
                    bottom: 0,
                    right: 190,
                    child: Image(image: AssetImage('assets/images/card_games/animal_card_game_image/right_side_chicken.png'),)
                ),
                const Positioned(
                    bottom: 0,
                    right: 240,
                    child: Image(image: AssetImage('assets/images/card_games/animal_card_game_image/right_side_chicken.png'),)
                ),
                const Positioned(
                    top: 10,
                    right: 0,
                    child: Image(image: AssetImage('assets/images/card_games/animal_card_game_image/house.png'))),
                const Positioned(
                    top: 100,
                    right: 90,
                    child: Image(image: AssetImage('assets/images/card_games/animal_card_game_image/left_side_chicken.png'))),
                const Positioned(
                    top: 120,
                    right: 140,
                    child: Image(image: AssetImage('assets/images/card_games/animal_card_game_image/right_side_chicken.png'))),
                const Positioned(
                    top: 120,
                    right: 190,
                    child: Image(image: AssetImage('assets/images/card_games/animal_card_game_image/right_side_chicken.png'))),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Image(image: AssetImage('assets/images/card_games/animal_card_game_image/exit.png'))),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 127),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    textToSpeech(animalNames[data.currentAnimal]);
                                  },
                                  child: Container(
                                    width: 320,
                                    height: 430,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF526D82),
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 300,
                                            height: 303,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFDDE6ED),
                                              borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(24)
                                              )
                                            ),
                                            child: Image(image: AssetImage(animalImages[data.currentAnimal]),),
                                          ),
                                          const SizedBox(height: 30,),
                                          Text(animalNames[data.currentAnimal], style: GoogleFonts.comfortaa(
                                              textStyle: const TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold
                                              )
                                          ),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          if(data.currentAnimal != 0){
                                            setState(() {
                                              data.currentAnimal -=1;
                                            });
                                          }
                                        },
                                        child: const Image(image: AssetImage('assets/images/card_games/animal_card_game_image/back.png'))
                                    ),
                                    const SizedBox(width: 30,),
                                    InkWell(
                                        onTap: () {
                                          if(data.currentAnimal < animalNames.length-1) {
                                            setState(() {
                                              data.currentAnimal += 1;
                                            });
                                          }
                                        },
                                        child: const Image(image: AssetImage('assets/images/card_games/animal_card_game_image/next.png'))
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
