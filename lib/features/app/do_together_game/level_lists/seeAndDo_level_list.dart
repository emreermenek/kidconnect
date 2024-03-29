
// ignore_for_file: file_names

import 'package:bootcamp_f32/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/seeAndDoNames_data.dart';
import '../games/do_together_seeAndDo_game.dart';
import '../services/seeAndDo_game_services.dart';

class SeeAndDoLevelListPage extends ConsumerStatefulWidget {
  const SeeAndDoLevelListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SeeAndDoLevelListPage> createState() => _SeeAndDoLevelListPageState();
}

class _SeeAndDoLevelListPageState extends ConsumerState<SeeAndDoLevelListPage> {
  final List routes = [];
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(seeAndDoGameServiceProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 75,
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Image(
                image: AssetImage('assets/images/level_list/exit.png'),
                width: 100,
              )),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Gör ve Yap',
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 24,
                  ))),
              const SizedBox(
                width: 20,
              ),
              const Image(
                image:
                    AssetImage('assets/images/home_page_image/cute-tiger.png'),
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
                    maxCrossAxisExtent: 550,
                    childAspectRatio: 14 / 3,
                    crossAxisSpacing: 8),
                itemCount: seeAndDoNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        data.currentCard = index;
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const DoTogetherSeeAndDoGame(),
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: tPrimaryColor,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(3, 4))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            seeAndDoNames[index],
                            style: GoogleFonts.comfortaa(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
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
