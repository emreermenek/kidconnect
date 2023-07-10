import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/card_games/nutrition_card_game/level_lists/foods_level_list.dart';
import 'package:bootcamp_f32/features/app/card_games/nutrition_card_game/level_lists/fruits_level_list.dart';
import 'package:bootcamp_f32/features/app/card_games/nutrition_card_game/level_lists/vegetables_level_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';


class NutritionCardGameLevelList extends ConsumerStatefulWidget {
  const NutritionCardGameLevelList({Key? key}) : super(key: key);

  @override
  ConsumerState<NutritionCardGameLevelList> createState() => _NutritionAndWeatherCardGameLevelListState();
}

class _NutritionAndWeatherCardGameLevelListState extends ConsumerState<NutritionCardGameLevelList> {

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
                  'BESLENME',
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
        backgroundColor: tWhiteColor,
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VegetablesCardGameLevelList(),));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: tPrimaryColor,
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
                        child: Text('SEBZELER', style: GoogleFonts.comfortaa(
                          textStyle:  const TextStyle(
                              color: Colors.black,
                              fontSize: 34,
                              fontWeight: FontWeight.bold
                          ),
                        ),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FruitsCardGameLevelList(),));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: tPrimaryColor,
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
                        child: Text('MEYVELER', style: GoogleFonts.comfortaa(
                          textStyle:  const TextStyle(
                              color: Colors.black,
                              fontSize: 34,
                              fontWeight: FontWeight.bold
                          ),
                        ),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FoodsCardGameLevelList(),));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: tPrimaryColor,
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
                        child: Text('YEMEKLER', style: GoogleFonts.comfortaa(
                          textStyle:  const TextStyle(
                              color: Colors.black,
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
