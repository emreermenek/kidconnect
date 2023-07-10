import 'package:bootcamp_f32/features/app/clock_game/part_of_days/level_list.dart';
import 'package:bootcamp_f32/features/app/clock_game/time/level_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';


class ClockGameLevelList extends ConsumerStatefulWidget {
  const ClockGameLevelList({Key? key}) : super(key: key);

  @override
  ConsumerState<ClockGameLevelList> createState() => _ClockGameLevelListState();
}

class _ClockGameLevelListState extends ConsumerState<ClockGameLevelList> {

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
                  'SAATLER',
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
        backgroundColor: Colors.white,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               InkWell(
                 onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TimeGameLevelList(),)),
                   child: const Image(image: AssetImage('assets/images/clock_game/time/saat kaç.png'),width: 265,height: 185,)),
                const SizedBox(height: 30,),
                InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PartOfDaysGameLevelList(),)),
                    child: const Image(image: AssetImage('assets/images/clock_game/part_of_days/günün bölümleri.png'),width: 265,height: 185,))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
