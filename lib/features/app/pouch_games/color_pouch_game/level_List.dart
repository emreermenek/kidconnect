// ignore_for_file: file_names

import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/pouch_games/color_pouch_game/color_pouch_game.dart';
import 'package:bootcamp_f32/features/app/pouch_games/color_pouch_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/utils.dart';

class ColorPouchGameLevelList extends ConsumerStatefulWidget {
  const ColorPouchGameLevelList({Key? key}) : super(key: key);

  @override
  ConsumerState<ColorPouchGameLevelList> createState() => _ColorPouchGameLevelListState();
}

class _ColorPouchGameLevelListState extends ConsumerState<ColorPouchGameLevelList> {
  List<String> levels =
  ['bölüm 1','bölüm 2','bölüm 3'];

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(colorPouchGameDataServiceProvider);
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
        backgroundColor: tWhiteColor,
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
                itemCount: levels.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      if(data.lock[index] == 'assets/images/level_list/open_lock.png'){
                        for(int i = 0; i < 3; i++){
                          if(i == index){
                            data.imageIndexList = List.generate(9 - i*3, (index) => index);
                          }
                        }
                        data.currentLevel = index;
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ColorPouchGame(),));
                      }else{
                        Utils.showSnackBar('Bölüm kitli!!!');
                      }
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(levels[index], style: GoogleFonts.comfortaa(
                            textStyle:  const TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                            ),
                          ),),
                          const SizedBox(width: 30,),
                          Image(image: AssetImage(data.lock[index]))
                        ],
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
