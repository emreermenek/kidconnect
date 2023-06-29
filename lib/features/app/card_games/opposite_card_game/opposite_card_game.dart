import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/card_games/opposite_card_game/data/opposite_front.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/opposite_back.dart';
import 'services/services.dart';

class OppositeCardGame extends ConsumerStatefulWidget {
  const OppositeCardGame({super.key});

  @override
  ConsumerState<OppositeCardGame> createState() => _OppositeCardGameState();
}

class _OppositeCardGameState extends ConsumerState<OppositeCardGame> {
  int pageIndex = 0;


  @override
  Widget build(BuildContext context) {
    final data = ref.watch(oppositeCardGameDataServiceProvider);
    final ValueNotifier<int> chooseOpposite = ValueNotifier<int>(data.currentOpposite);
    final ValueNotifier<int> choosePage = ValueNotifier<int>(pageIndex);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ValueListenableBuilder(
            valueListenable: chooseOpposite,
            builder: (BuildContext context, value, Widget? child) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/card_games/opposite_card_game/background.png'),
                    fit: BoxFit.fill
                  )
                ),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 85),
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        pageIndex = 0;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: const Image(image: AssetImage('assets/images/card_games/emotions_card_game/exit.png'))),
                              ),
                            ],
                          ),

                          ValueListenableBuilder(
                            valueListenable: choosePage,
                            builder: (BuildContext context, value, Widget? child) {
                              if(pageIndex == 0){
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        textToSpeech(firstNames[data.currentOpposite]);
                                      },
                                      child: Container(
                                        width: 320,
                                        height: 230,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF96F6D),
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.all(8),
                                                width: 300,
                                                height: 160,
                                                decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.vertical(
                                                        top: Radius.circular(24)
                                                    )
                                                ),
                                                child: Image(image: AssetImage(firstImages[data.currentOpposite]),),
                                              ),
                                              const SizedBox(height: 15,),
                                              Text(firstNames[data.currentOpposite], style: GoogleFonts.comfortaa(
                                                  textStyle: const TextStyle(
                                                      fontSize: 28,
                                                      fontWeight: FontWeight.bold
                                                  )
                                              ),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            textToSpeech(secondNames[data.currentOpposite]);
                                          },
                                          child: Container(
                                            width: 320,
                                            height: 230,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF96F6D),
                                              borderRadius: BorderRadius.circular(32),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.all(8),
                                                    width: 300,
                                                    height: 160,
                                                    decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.vertical(
                                                            top: Radius.circular(24)
                                                        )
                                                    ),
                                                    child: Image(image: AssetImage(secondImages[data.currentOpposite]),),
                                                  ),
                                                  const SizedBox(height: 15,),
                                                  Text(secondNames[data.currentOpposite], style: GoogleFonts.comfortaa(
                                                      textStyle: const TextStyle(
                                                          fontSize: 28,
                                                          fontWeight: FontWeight.bold
                                                      )
                                                  ),)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 30,),
                                      ],
                                    ),
                                  ],
                                );
                              }else{
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        textToSpeech(twoNames[data.currentOpposite]);
                                      },
                                      child: Container(
                                        width: 320,
                                        height: 430,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF96F6D),
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.all(8),
                                                width: 300,
                                                height: 303,
                                                decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.vertical(
                                                        top: Radius.circular(24)
                                                    )
                                                ),
                                                child: Image(image: AssetImage(twoImages[data.currentOpposite]),),
                                              ),
                                              const SizedBox(height: 40,),
                                              Text(twoNames[data.currentOpposite], style: GoogleFonts.comfortaa(
                                                  textStyle: const TextStyle(
                                                      fontSize: 28,
                                                      fontWeight: FontWeight.bold
                                                  )
                                              ),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 80,),
                                  ],
                                );

                              }

                           }
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {
                                    if(pageIndex == 0){
                                      if(data.currentOpposite != 0){
                                        setState(() {
                                          pageIndex = 1;
                                          data.currentOpposite -=1;
                                        });
                                      }
                                    }else{
                                        setState(() {
                                          pageIndex = 0;
                                        });
                                    }
                                  },
                                  child: const Image(image: AssetImage('assets/images/card_games/opposite_card_game/back.png'))
                              ),
                              const SizedBox(width: 30,),
                              InkWell(
                                  onTap: () {
                                    if(pageIndex == 0){
                                      setState(() {
                                        pageIndex = 1;
                                      });
                                    }else{
                                      if(data.currentOpposite < twoNames.length-1) {
                                        setState(() {
                                          pageIndex = 0;
                                          data.currentOpposite += 1;
                                        });
                                      }
                                    }

                                  },
                                  child: const Image(image: AssetImage('assets/images/card_games/opposite_card_game/next.png'))
                              ),
                            ],
                          ),
                        ],
                      ),
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
