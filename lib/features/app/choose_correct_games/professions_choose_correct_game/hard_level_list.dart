import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/professions_choose_correct_game/hard_profession_choose_correct_game.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/professions_choose_correct_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/utils.dart';


class HardProfessionChooseCorrectGameLevelList extends ConsumerStatefulWidget {
  const HardProfessionChooseCorrectGameLevelList({Key? key}) : super(key: key);

  @override
  ConsumerState<HardProfessionChooseCorrectGameLevelList> createState() => _HardProfessionChooseCorrectGameLevelListState();
}

class _HardProfessionChooseCorrectGameLevelListState extends ConsumerState<HardProfessionChooseCorrectGameLevelList> {
  List<String> levels =
  ['bölüm 1','bölüm 2','bölüm 3','bölüm 4','bölüm 5','bölüm 6','bölüm 7','bölüm 8','bölüm 9','bölüm 10','bölüm 11','bölüm 12','bölüm 13','bölüm 14'];

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(professionChooseCorrectGameServiceProvider);
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
                      if(data.lockHard[index] == 'assets/images/level_list/open_lock.png'){
                        data.currentLevelHard = index;
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HardProfessionChooseCorrectGame(),));
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
                          Image(image: AssetImage(data.lockHard[index]))
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
