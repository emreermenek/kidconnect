
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/black_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/blue_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/brown_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/green_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/orange_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/pink_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/red_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/color_card_games/yellow_card_game.dart';
import 'package:bootcamp_f32/features/app/card_games/color_card_game/data/colors_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_card_games/purple_card_game.dart';


class ColorCardGameLevelList extends ConsumerStatefulWidget {
  const ColorCardGameLevelList({Key? key}) : super(key: key);

  @override
  ConsumerState<ColorCardGameLevelList> createState() => _ColorCardGameLevelListState();
}

class _ColorCardGameLevelListState extends ConsumerState<ColorCardGameLevelList> {

  List colorNavigation =
  [
    const YellowCardGame(), const RedCardGame(), const BlueCardGame(), const GreenCardGame(), const OrangeCardGame(),
    const PurpleCardGame(), const BrownCardGame(), const PinkCardGame(), const BlackCardGame()
  ];
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
                  'RENKLER',
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
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 600,
                    childAspectRatio: 14/3,
                    crossAxisSpacing: 8
                ),
                itemCount: colors.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => colorNavigation[index],));
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
                        child: Text(colors[index], style: GoogleFonts.comfortaa(
                          textStyle:  const TextStyle(
                              color: Color(0xFFBDF2D5),
                              fontSize: 40,
                              fontWeight: FontWeight.bold
                          ),
                        ),),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
