

import 'dart:math';

import 'package:analog_clock/analog_clock.dart';
import 'package:bootcamp_f32/features/app/card_games/clock_card_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MorningCardGame extends ConsumerStatefulWidget {
  const MorningCardGame({super.key});

  @override
  ConsumerState<MorningCardGame> createState() => _MorningCardGameState();
}

class _MorningCardGameState extends ConsumerState<MorningCardGame> {
  int hour = Random().nextInt(6) + 6;
  int minute = 0;
  List<int> hourList = List.generate(6, (index) => index + 6);
  List<int> minuteList = List.generate(61, (index) => index);
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(clockCardGameDataServiceProvider);
    final ValueNotifier<int> time = ValueNotifier<int>(data.currentTime);
    hourList.remove(hour);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/card_games/clock_card_game_image/sabah.png'),
              fit: BoxFit.fill
            ),
          ),
          child: SingleChildScrollView(
            child: ValueListenableBuilder(
              valueListenable: time,
              builder: (BuildContext context, value, Widget? child)
              {
                hourList = List.generate(6, (index) => index + 6);
                minuteList = List.generate(61, (index) => index);
                if(data.currentTime == 0){
                    minute = 0;
                    minuteList.remove(minute);
                }else if(data.currentTime == 1){
                    minute = 15;
                    minuteList.remove(minute);
                }else if(data.currentTime == 2){
                    minute = 30;
                    minuteList.remove(minute);
                }else{
                    minute = minuteList[Random().nextInt(58)];
                    hour = hourList[Random().nextInt(6)];
                }
              return Column(
                children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 30),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       InkWell(
                           onTap: () {
                             data.currentTime = 0;
                             Navigator.of(context).pop();
                           },
                           child: const Image(image: AssetImage('assets/images/card_games/clock_card_game_image/btn_cikis.png'))
                       ),
                       Text('${data.currentTime+1}/4',
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
                  const SizedBox(height: 10,),
                  Center(
                    child: Container(
                      width: 320,
                      height: 430,
                      decoration: BoxDecoration(
                        color: const Color(0xFF9BBFBE),
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
                              child: Container(
                                padding: const EdgeInsets.only(top: 95,right: 55,left: 55, bottom: 23),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/card_games/clock_card_game_image/saat.png')
                                  )
                                ),
                                child: AnalogClock(
                                    decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                        shape: BoxShape.circle
                                    ),
                                    isLive: false,
                                    showDigitalClock: false,
                                    hourHandColor: Colors.black,
                                    minuteHandColor: Colors.black,
                                    textScaleFactor: 1.7,
                                    showAllNumbers: true,
                                    showSecondHand: false,
                                    width: 90,
                                    datetime: DateTime(
                                        1,
                                        1,
                                        2,
                                        hour, //saat
                                        minute //dakika
                                    )
                                ),
                              )
                            ),
                            const SizedBox(height: 10,),
                            ValueListenableBuilder(
                                valueListenable: time,
                                builder: (context, value, child) {
                                  if(hour == 12 && minute < 10 ){
                                    return RichText(
                                        text: TextSpan(
                                          text: '12:',
                                            style: GoogleFonts.montserratAlternates(
                                                textStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 64
                                                ),
                                            ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '0$minute',
                                              style: GoogleFonts.montserratAlternates(
                                                textStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                    fontSize: 72
                                                )
                                              )
                                            )
                                          ]
                                        )
                                    );
                                  }else if(hour == 12 && minute >= 10){
                                    return RichText(
                                        text: TextSpan(
                                            text: '12:',
                                            style: GoogleFonts.montserratAlternates(
                                              textStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 64
                                              ),
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: '$minute',
                                                  style: GoogleFonts.montserratAlternates(
                                                      textStyle: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 64
                                                      )
                                                  )
                                              )
                                            ]
                                        )
                                    );
                                  }else if(hour < 10 && minute < 10){
                                    return RichText(
                                        text: TextSpan(
                                            text: '0$hour:',
                                            style: GoogleFonts.montserratAlternates(
                                              textStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 64
                                              ),
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: '0$minute',
                                                  style: GoogleFonts.montserratAlternates(
                                                      textStyle: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 64
                                                      )
                                                  )
                                              )
                                            ]
                                        )
                                    );
                                  }else if(hour >= 10 && hour != 12 && minute < 10){
                                    return RichText(
                                        text: TextSpan(
                                            text: '$hour:',
                                            style: GoogleFonts.montserratAlternates(
                                              textStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 64
                                              ),
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: '0$minute',
                                                  style: GoogleFonts.montserratAlternates(
                                                      textStyle: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 64
                                                      )
                                                  )
                                              )
                                            ]
                                        )
                                    );
                                  }else if(hour < 10 && minute > 10){
                                    return RichText(
                                        text: TextSpan(
                                            text: '0$hour:',
                                            style: GoogleFonts.montserratAlternates(
                                              textStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 64
                                              ),
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: '$minute',
                                                  style: GoogleFonts.montserratAlternates(
                                                      textStyle: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 64
                                                      )
                                                  )
                                              )
                                            ]
                                        )
                                    );
                                  }else{
                                    return RichText(
                                        text: TextSpan(
                                            text: '$hour:',
                                            style: GoogleFonts.montserratAlternates(
                                              textStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 64
                                              ),
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: '$minute',
                                                  style: GoogleFonts.montserratAlternates(
                                                      textStyle: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 64
                                                      )
                                                  )
                                              )
                                            ]
                                        )
                                    );
                                  }
                                },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            if(data.currentTime < 3) {
                              setState(() {
                                data.currentTime += 1;
                              });
                            }
                          },
                          child: const Image(image: AssetImage('assets/images/card_games/clock_card_game_image/btn_sonraki.png'))
                      ),
                    ],
                  )
                ],
              );
  }
            ),
          ),
        ),
      ),
    );
  }
}
