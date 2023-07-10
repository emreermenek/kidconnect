import 'package:bootcamp_f32/common_widgets/bottom_navigation_bar_widget.dart';
import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/coming_soon_screen/coming_soon_screen.dart';
import 'package:bootcamp_f32/features/app/main_pages/games_pages/games_main_page.dart';
import 'package:bootcamp_f32/features/app/main_pages/lets_learn_page/lets_learn.dart';
import 'package:bootcamp_f32/features/app/main_pages/songs_page/songs.dart';
import 'package:bootcamp_f32/features/app/main_pages/vocalizing_page/vocalizing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../common_widgets/app_bar_dialog_clip.dart';
import '../../do_together_game/level_lists/do_together_level_list.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final List cards = [
  'assets/images/home_page_image/content/card-games.png',
  'assets/images/home_page_image/content/card8.png',
  'assets/images/home_page_image/content/lego 1.png',
  'assets/images/home_page_image/content/paper-crafts 1.png',
  'assets/images/home_page_image/content/card5.png',
  'assets/images/home_page_image/content/card7.png',
];

final List texts = [
  'ÖĞRENELİM',
  'BOYAMA',
  'OYUNLAR',
  'BİRLİKTE YAPALIM',
  'SESLENDİRME',
  'ŞARKILAR'
];

final List routes = [
  const LetsLearnPage(),
  const ComingSoonScreen(),
  const GamesMainPage(),
  const DoTogetherLevelListPage(),
  const VocalizingPage(),
  const SongsPage()
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 75,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              child: ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    color: tPrimaryColor,
                    child: Center(
                        child: Text(
                      'Hoşgeldin',
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18,
                                )
                            )
                        ),
                    ),
                  )),
            ),
            const SizedBox(width: 10,),
            const Image(
              image: AssetImage('assets/images/home_page_image/cute-tiger.png'),
              width: 75,
            ),
          ],
        ),
      ),
      bottomNavigationBar: botNavBar(currentIndex: 0, context: context),
      body: Stack(
        children: [
          const Positioned(
              left: 0,
              top: 0,
              child: Image(
                image: AssetImage(
                    'assets/images/home_page_image/content/shape7.png'),
              )),
          const Positioned(
              right: 0,
              top: 0,
              child: Image(
                image: AssetImage(
                    'assets/images/home_page_image/content/shape6.png'),
              )),
          const Positioned(
              left: 0,
              bottom: 0,
              child: Image(
                image: AssetImage(
                    'assets/images/home_page_image/content/shape5.png'),
              )),
          const Positioned(
              right: 0,
              bottom: 0,
              child: Image(
                image: AssetImage(
                    'assets/images/home_page_image/content/shape4.png'),
              )),
          const Positioned(
              right: 0,
              top: 170,
              child: Image(
                image: AssetImage(
                    'assets/images/home_page_image/content/shape3.png'),
              )),
          const Positioned(
              left: 0,
              top: 150,
              child: Image(
                image: AssetImage(
                    'assets/images/home_page_image/content/shape1.png'),
              )),
          GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:
                  300, //if you have a device with 300px width only one category is shown in a row if you have 500px then two categories are lied side by side in a row
              childAspectRatio: 1,// for 200px width, I need 300px height (for extra spacing)
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => routes[index],
                    ),
                  );
                },
                child: GridTile(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              color: Colors.grey.shade500,
                              offset: const Offset(0, 6)),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(cards[index]),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              texts[index],
                              style: const TextStyle(fontSize: 16),
                              textScaleFactor: 1.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


