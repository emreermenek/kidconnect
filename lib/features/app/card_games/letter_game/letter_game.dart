import 'dart:ui';

import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/colors.dart';
import 'data/backgroundColor.dart';
import 'data/big_letter.dart';
import 'data/letter_image.dart';
import 'data/two_letter.dart';


class LetterGame extends StatefulWidget {
  const LetterGame({Key? key}) : super(key: key);

  @override
  State<LetterGame> createState() => _LetterGameState();
}

class _LetterGameState extends State<LetterGame> {
  bool readAtFirstOpen = true;
  int i = -1;
  int colorIndex = 0;
  late FlipCardController _controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = FlipCardController();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = backgroundColors[colorIndex];
    final ValueNotifier<int> letterNumber= ValueNotifier<int>(i);
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 1500),
                width: double.infinity,
                height: double.infinity,
                color: color,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                child: Column(
                  children:
                  [
                   Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () =>  Navigator.of(context).pop(),
                              child: const Image(image: AssetImage('assets/images/buttons/exit_button.png')))
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 92,
                              childAspectRatio: 1,
                              crossAxisSpacing: 8
                          ),
                          itemCount: bigLetters.length,
                          itemBuilder: (context, index)
                          {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    i = index;
                                    colorIndex = backgroundColorIndex[index];
                                  });
                                  textToSpeech(bigLetters[i]);
                                },
                                child: Container
                                  (
                                  alignment: Alignment.center,
                                    margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(32),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade600,
                                            offset: const Offset(
                                                1,
                                                2
                                            )
                                        )
                                      ]
                                    ),
                                    child: Image(image: AssetImage(bigLetterImages[index]),width: 60,height: 60,),
                                  ),
                              );
                          },
                      ),
                    )
                  ],
                ),
              ),
              ValueListenableBuilder(
                valueListenable: letterNumber,
                builder: (context, value, child) {
                  if(value != -1){
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              i = -1;
                              readAtFirstOpen = true;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.transparent,
                          ),
                        ),
                        TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0,end: 1),
                          duration: const Duration(milliseconds: 200),
                          builder: (context, value, child) {
                            return BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10,
                                sigmaY: 10
                              ),
                              child: FlipCard(
                                controller: _controller,
                                flipOnTouch: false,
                                speed: 300,
                                direction: FlipDirection.HORIZONTAL,
                                /*
                                  ------------
                                   Front Side
                                  ------------
                                */
                                front: Center(
                                  child: Container(
                                    height: value * 620,
                                    width: value*320,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,

                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(value*8),
                                      child: Column(
                                        children:
                                        [
                                          Padding(
                                            padding: EdgeInsets.all(value*8),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('okunuşunu tekrar\ndinlemek için tıkla',  style: GoogleFonts.gluten(
                                                  textStyle:  TextStyle(
                                                    color: tBlackColor,
                                                    fontSize: value*16,
                                                    fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                                ),
                                                SizedBox(width: value*15,),
                                                InkWell(
                                                  onTap: () {
                                                    textToSpeech(bigLetters[i]);
                                                  },
                                                    child: Image(image: const AssetImage('assets/images/buttons/speaker_button.png'),width: value*50,)
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: value*130,),
                                          Image(image: AssetImage(twoLetterImages[i]),width: value*258,height: value*190,),
                                          SizedBox(height: value*135,),
                                          InkWell(
                                              onTap: () {
                                                _controller.toggleCard();
                                                if(readAtFirstOpen == true){
                                                  textToSpeech(letterImageNames[i]);
                                                  setState(() {
                                                    readAtFirstOpen = false;
                                                  });
                                                }
                                              },
                                              child: Image(image: const AssetImage('assets/images/buttons/flip_button.png'),width: value*50,)),
                                          Text('çevir',style: GoogleFonts.gluten(
                                            textStyle:  TextStyle(
                                              color: tBlackColor,
                                                fontSize: value*16,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),),
                                          SizedBox(height: value*10,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                /*
                                  -----------
                                   Back Side
                                  -----------
                                */
                                back: Center(
                                  child: Container(
                                    height: value * 620,
                                    width: value*320,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,

                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(value*8),
                                      child: Column(
                                        children:
                                        [
                                          Padding(
                                            padding: EdgeInsets.all(value*8),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('okunuşunu tekrar\ndinlemek için tıkla',style: GoogleFonts.gluten(
                                                  textStyle:  TextStyle(
                                                    color: tBlackColor,
                                                      fontSize: value*16,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),),
                                                SizedBox(width: value*15,),
                                                InkWell(
                                                    onTap: () {
                                                      textToSpeech(letterImageNames[i]);
                                                    },
                                                    child: Image(image: const AssetImage('assets/images/buttons/speaker_button.png'),width: value*50,)
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: value*80,),
                                          Image(image: AssetImage(letterImage[i]),width: value*250,height: value*250,),
                                          SizedBox(height: value*10,),
                                          Text(letterImageNames[i],style: GoogleFonts.comfortaa(
                                            textStyle:  TextStyle(
                                              color: tBlackColor,
                                              fontSize: value*30,
                                              fontWeight: FontWeight.w700
                                            ),
                                          ),),
                                          SizedBox(height: value*80,),
                                          InkWell(
                                              onTap: () {
                                                _controller.toggleCard();
                                              },
                                              child: Image(image: const AssetImage('assets/images/buttons/categories_button.png'),width: value*50,)
                                          ),
                                          Text('alfabeler',style: GoogleFonts.gluten(
                                            textStyle:  TextStyle(
                                              color: tBlackColor,
                                                fontSize: value*16,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),),
                                          SizedBox(height: value*10,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  }else{
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        )
    );
  }
}
