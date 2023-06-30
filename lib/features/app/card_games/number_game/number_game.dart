import 'dart:math';
import 'dart:ui';
import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constants/colors.dart';
import 'data/backgroundColor.dart';
import 'data/flip1.dart';
import 'data/flip2.dart';

class NumberGame extends StatefulWidget {
  const NumberGame({Key? key}) : super(key: key);

  @override
  State<NumberGame> createState() => _NumberGameState();
}

class _NumberGameState extends State<NumberGame> {
  bool readAtFirstOpen = true;
  int i = -1;
  int colorIndex = 5;
  late FlipCardController _controller;
  int whichImageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = FlipCardController();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = backgroundColorsNumbers[colorIndex];
    final ValueNotifier<int> numberGameNumbers= ValueNotifier<int>(i);
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
                            onTap: () => Navigator.of(context).pop(),
                              child: const Image(image: AssetImage('assets/images/number_game_image/btn_cik.png')))
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
                        itemCount: 12,
                        itemBuilder: (context, index)
                        {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                i = index;
                                colorIndex = backgroundColorIndexNumber[index];
                                whichImageIndex = Random().nextInt(12);
                              });
                              textToSpeech(numberNames2[index]);
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
                              child: Image(image: AssetImage(numberImages2[index]),width: 60,height: 60,),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              ValueListenableBuilder(
                valueListenable: numberGameNumbers,
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
                                                      textToSpeech(numberNames2[i]);
                                                    },
                                                    child: Image(image: const AssetImage('assets/images/buttons/speaker_button.png'),width: value*50,)
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: value*80,),
                                          Image(image: AssetImage(numberImages2[i]),width: value*258,height: value*190,),
                                          SizedBox(height: value*20,),
                                          Text(numberNames2[i],style: GoogleFonts.comfortaa(
                                            textStyle:  TextStyle(
                                                color: Colors.black,
                                                fontSize: value*48,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),),
                                          SizedBox(height: value*100,),
                                          InkWell(
                                              onTap: () {
                                                _controller.toggleCard();
                                                if(readAtFirstOpen == true){
                                                  textToSpeech(howMany[i] + shapeNamesNumber[whichImageIndex]);
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
                                    height: 620,
                                    width: 320,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,

                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        children:
                                        [
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('okunuşunu tekrar\ndinlemek için tıkla',style: GoogleFonts.gluten(
                                                  textStyle:  const TextStyle(
                                                      color: tBlackColor,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),),
                                                const SizedBox(width: 15,),
                                                InkWell(
                                                    onTap: () {
                                                      textToSpeech(howMany[i] + shapeNamesNumber[whichImageIndex]);
                                                    },
                                                    child: const Image(image: AssetImage('assets/images/buttons/speaker_button.png'),width: 50,)
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 40,),
                                          ValueListenableBuilder(
                                              valueListenable: numberGameNumbers,
                                              builder: (BuildContext context, value, Widget? child) {
                                                if((i+1) == 1){
                                                  return Center(
                                                    child: Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250,height: 250,),
                                                  );
                                                }else if((i+1) == 2){
                                                  return Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 250,),
                                                      Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 250,),
                                                    ],
                                                  );
                                                }else if((i+1) == 3){
                                                  return Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 125,),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 125,),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 125,),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                }else if((i+1) == 4){
                                                  return Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 125,),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 125),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 125),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 125),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                }else if((i+1) == 5){
                                                  return Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 250/3,),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 250/3),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 250/3),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 250/3),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 250/3),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                }else if((i+1) == 6){
                                                  return Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 250/3,),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 250/3,),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 250/3,),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 250/3,),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 250/3,),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 125,height: 250/3,),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                }else if((i+1) == 7){
                                                  return Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3,),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3,),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3,),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3,),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3,),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3,),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                }else if((i+1) == 8){
                                                  return Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3,),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                }else if((i+1) == 9){
                                                  return Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3,),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 80,),

                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [

                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3,),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3,),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3,),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [

                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3,),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/3),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                }else if((i+1) == 10){
                                                  return Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),

                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [

                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [

                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [

                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                }else if((i+1) == 11){
                                                  return Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),

                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [

                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [

                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),

                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                }else if((i+1) == 12){
                                                  return Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),

                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [

                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [

                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                          Image(image: AssetImage(shapeImages[whichImageIndex]),width: 250/3,height: 250/4),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                }else{
                                                  return const SizedBox.shrink();
                                                }
                                              },

                                          ),
                                          const SizedBox(height: 30,),
                                          Text(howMany[i],style: GoogleFonts.comfortaa(
                                            textStyle:  const TextStyle(
                                                color: tBlackColor,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w700
                                            ),
                                          ),),
                                          Text(shapeNamesNumber[whichImageIndex],style: GoogleFonts.comfortaa(
                                            textStyle:  const TextStyle(
                                                color: tBlackColor,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w700
                                            ),
                                          ),),
                                          const SizedBox(height: 70,),
                                          InkWell(
                                              onTap: () {
                                                _controller.toggleCard();
                                              },
                                              child: const Image(image: AssetImage('assets/images/buttons/categories_button.png'),width: 50,)
                                          ),
                                          Text('alfabeler',style: GoogleFonts.gluten(
                                            textStyle:  const TextStyle(
                                                color: tBlackColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),),
                                          const SizedBox(height: 10,)
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
