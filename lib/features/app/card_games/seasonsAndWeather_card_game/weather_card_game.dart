import 'package:bootcamp_f32/common_features/text_to_speech.dart';
import 'package:bootcamp_f32/features/app/card_games/seasonsAndWeather_card_game/data/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'services/services.dart';

class WeatherCardGame extends ConsumerStatefulWidget {
  const WeatherCardGame({super.key});

  @override
  ConsumerState<WeatherCardGame> createState() => _WeatherCardGameState();
}

class _WeatherCardGameState extends ConsumerState<WeatherCardGame> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(seasonCardGameDataServiceProvider);
    final ValueNotifier<int> chooseWeather =
        ValueNotifier<int>(data.currentWeather);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F3D6),
        body: ValueListenableBuilder(
            valueListenable: chooseWeather,
            builder: (BuildContext context, value, Widget? child) {
              return Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.bottomCenter,
                            fit: BoxFit.fitWidth,
                            image: AssetImage(
                                'assets/images/card_games/seasons_card_game/down background.png'))),
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 85),
                      child: Image(
                          image: AssetImage(
                              'assets/images/card_games/seasons_card_game/up background.png')),
                    ),
                  ),
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
                                child: const Image(
                                    image: AssetImage(
                                        'assets/images/card_games/seasons_card_game/exit.png'))),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            textToSpeech(weatherNames[data.currentWeather]);
                          },
                          child: Container(
                            width: 320,
                            height: 430,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF2AB27),
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
                                        color: Colors.white,
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(24))),
                                    child: Image(
                                      image: AssetImage(
                                          weatherImages[data.currentWeather]),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    weatherNames[data.currentWeather],
                                    style: GoogleFonts.comfortaa(
                                        textStyle: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  if (data.currentWeather != 0) {
                                    setState(() {
                                      data.currentWeather -= 1;
                                    });
                                  }
                                },
                                child: const Image(
                                    image: AssetImage(
                                        'assets/images/card_games/seasons_card_game/back.png'))),
                            const SizedBox(
                              width: 30,
                            ),
                            InkWell(
                                onTap: () {
                                  if (data.currentWeather <
                                      weatherNames.length - 1) {
                                    setState(() {
                                      data.currentWeather += 1;
                                    });
                                  }
                                },
                                child: const Image(
                                    image: AssetImage(
                                        'assets/images/card_games/seasons_card_game/next.png'))),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
