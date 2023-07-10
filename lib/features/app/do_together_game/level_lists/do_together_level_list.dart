
import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/do_together_game/level_lists/seeAndDo_level_list.dart';
import 'package:bootcamp_f32/features/app/do_together_game/level_lists/sports_level_list.dart';
import 'package:flutter/material.dart';
import '../../../../common_widgets/app_bar_widget.dart';
import '../../../../common_widgets/bottom_navigation_bar_widget.dart';

class DoTogetherLevelListPage extends StatefulWidget {
  const DoTogetherLevelListPage({Key? key}) : super(key: key);

  @override
  State<DoTogetherLevelListPage> createState() => _DoTogetherLevelListPageState();
}

class _DoTogetherLevelListPageState extends State<DoTogetherLevelListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tWhiteColor,
        appBar: const AppBarWidget(
          title: 'Birlikte Yapalım',
        ),
        bottomNavigationBar: botNavBar(currentIndex: 0, context: context),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SeeAndDoLevelListPage(),
                        )),
                    child: const Image(
                      image: AssetImage(
                          'assets/images/do_together_images/background/gör ve yap.png'),
                      width: 265,
                      height: 185,
                    )),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SportsListPage(),
                        )),
                    child: const Image(
                      image: AssetImage(
                          'assets/images/do_together_images/background/spor yapalım.png'),
                      width: 265,
                      height: 185,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
