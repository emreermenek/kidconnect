import 'package:bootcamp_f32/features/app/which_one_correct_game/services/data_service.dart';
import 'package:bootcamp_f32/features/app/which_one_correct_game/which_one_correct_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/utils.dart';

class WhichOneCorrectGameLevelList extends ConsumerStatefulWidget {
  const WhichOneCorrectGameLevelList({Key? key}) : super(key: key);

  @override
  ConsumerState<WhichOneCorrectGameLevelList> createState() => _ChooseCorrectGameLevelListState();
}

class _ChooseCorrectGameLevelListState extends ConsumerState<WhichOneCorrectGameLevelList> {
  List<String> levels =
  ['bölüm 1','bölüm 2','bölüm 3','bölüm 4','bölüm 5','bölüm 6','bölüm 7','bölüm 8','bölüm 9','bölüm 10'];

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(dataServiceProvider2);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF6CBBB3),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Image(image: AssetImage('assets/images/level_list/exit.png'),width: 50,height: 50,)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BÖLÜMLER', style: GoogleFonts.comfortaa(
                  textStyle:  const TextStyle(
                      color: Color(0xFF3E3838),
                      fontSize: 60,
                      fontWeight: FontWeight.bold
                  ),
                ),),
              ],
            ),
            const SizedBox(height: 20,),
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
                          data.currentLevel = index;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WhichOneCorrectGame(),));
                      }else{
                        Utils.showSnackBar('Bölüm kitli!!!');
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 100,),
                      decoration: BoxDecoration(
                          color: const Color(0xFFEFE784),
                          borderRadius: BorderRadius.circular(52),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade600,
                                offset: const Offset(
                                    1,
                                    3
                                )
                            )
                          ]
                      ),
                      child: Row(
                        children: [
                          Text(levels[index], style: GoogleFonts.comfortaa(
                            textStyle:  const TextStyle(
                                color: Color(0xFF3E3838),
                                fontSize: 48,
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
