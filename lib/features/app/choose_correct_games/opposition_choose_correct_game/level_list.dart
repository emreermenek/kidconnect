import 'package:bootcamp_f32/features/app/choose_correct_games/opposition_choose_correct_game/opposition_choose_correct_game.dart';
import 'package:bootcamp_f32/features/app/choose_correct_games/opposition_choose_correct_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/utils.dart';


class OppositionChooseCorrectGameLevelList extends ConsumerStatefulWidget {
  const OppositionChooseCorrectGameLevelList({Key? key}) : super(key: key);

  @override
  ConsumerState<OppositionChooseCorrectGameLevelList> createState() => _OppositionChooseCorrectGameLevelListState();
}

class _OppositionChooseCorrectGameLevelListState extends ConsumerState<OppositionChooseCorrectGameLevelList> {
  List<String> levels =
  [
    'bölüm 1','bölüm 2','bölüm 3','bölüm 4','bölüm 5','bölüm 6','bölüm 7','bölüm 8','bölüm 9','bölüm 10',
    'bölüm 11','bölüm 12','bölüm 13','bölüm 14','bölüm 15','bölüm 16','bölüm 17','bölüm 18','bölüm 19','bölüm 20',
    'bölüm 21','bölüm 22','bölüm 23','bölüm 24','bölüm 25','bölüm 26', 'bölüm 27', 'bölüm 28', 'bölüm 29','bölüm 30',
    'bölüm 31', 'bölüm 32'
  ];

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(oppositionChooseCorrectGameServiceProvider);
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
                      if(data.lockEasy[index] == 'assets/images/level_list/open_lock.png'){
                        data.currentLevel = index;
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OppositionChooseCorrectGame(),));
                      }else{
                        Utils.showSnackBar('Bölüm kitli!!!');
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 100,),
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
                      child: Row(
                        children: [
                          Text(levels[index], style: GoogleFonts.comfortaa(
                            textStyle:  const TextStyle(
                                color: Color(0xFFBDF2D5),
                                fontSize: 48,
                                fontWeight: FontWeight.bold
                            ),
                          ),),
                          const SizedBox(width: 30,),
                          Image(image: AssetImage(data.lockEasy[index]))
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
