import 'package:bootcamp_f32/features/app/card_games/seasonsAndWeather_card_game/seasonLevel_list.dart';
import 'package:bootcamp_f32/features/app/card_games/seasonsAndWeather_card_game/weatherLevel_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';


class SeasonAndWeatherCardGameLevelList extends ConsumerStatefulWidget {
  const SeasonAndWeatherCardGameLevelList({Key? key}) : super(key: key);

  @override
  ConsumerState<SeasonAndWeatherCardGameLevelList> createState() => _SeasonAndWeatherCardGameLevelListState();
}

class _SeasonAndWeatherCardGameLevelListState extends ConsumerState<SeasonAndWeatherCardGameLevelList> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 75,
          elevation: 0,
          leading: InkWell(
              onTap: ()
              {
                Navigator.of(context).pop();
              },
              child: const Image(image: AssetImage('assets/images/level_list/exit.png'),width: 100,)
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'BÖLÜMLER',
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 24,
                      )
                  )
              ),
              const SizedBox(width: 20,),
              const Image(
                image: AssetImage('assets/images/home_page_image/cute-tiger.png'),
                width: 75,
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xFFBDF2D5),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 600,
                    childAspectRatio: 14/3,
                    crossAxisSpacing: 8
                ),
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SeasonCardGameLevelList(),));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xFF4B5D67),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(
                                    3,
                                    4
                                )
                            )
                          ]
                      ),
                      child: Center(
                        child: Text('MEVSİMLER', style: GoogleFonts.comfortaa(
                          textStyle:  const TextStyle(
                              color: Color(0xFFBDF2D5),
                              fontSize: 34,
                              fontWeight: FontWeight.bold
                          ),
                        ),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WeatherCardGameLevelList(),));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xFF4B5D67),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(
                                    3,
                                    4
                                )
                            )
                          ]
                      ),
                      child: Center(
                        child: Text('HAVA DURUMU', style: GoogleFonts.comfortaa(
                          textStyle:  const TextStyle(
                              color: Color(0xFFBDF2D5),
                              fontSize: 34,
                              fontWeight: FontWeight.bold
                          ),
                        ),),
                      ),
                    ),
                  ),
                ],

              ),
            )
          ],
        ),
      ),
    );
  }
}
