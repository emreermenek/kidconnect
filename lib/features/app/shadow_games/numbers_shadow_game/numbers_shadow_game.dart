import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberShadowGame extends StatefulWidget {
  const NumberShadowGame({super.key});

  @override
  State<NumberShadowGame> createState() => _NumberShadowGameState();
}

class _NumberShadowGameState extends State<NumberShadowGame> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.bottomLeft,
            child: Image(
              image: AssetImage(
                  'assets/images/shadow_games/background/bottom_left_background.png'),
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: Image(
              image: AssetImage(
                  'assets/images/shadow_games/background/bottom_right_background.png'),
            ),
          ),
          const Positioned(
            left: 0,
            bottom: 220,
            child: Image(
              image: AssetImage(
                  'assets/images/shadow_games/background/left_background.png'),
            ),
          ),
          const Positioned(
            right: 0,
            bottom: 220,
            child: Image(
              image: AssetImage(
                  'assets/images/shadow_games/background/right_background.png'),
            ),
          ),
          /*
          ------------------------
                  column
          ------------------------
          */
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 325,
                  decoration: const BoxDecoration(
                      color: Color(0xFFD27070),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(24),
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          /*
          ------------------------
                  column
          ------------------------
          */
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Image(
                    image: AssetImage(
                        'assets/images/shadow_games/background/exit_button.png'),
                  )),
            ),
          ),
          const Positioned(
              top: 10,
              right: 10,
              child: Image(
                  image: AssetImage(
                      'assets/images/shadow_games/background/tiger_looking_down.png'))),
          Positioned(
              top: 50,
              right: size.width * 0.32,
              child: Text(
                '            HADİ!\nGÖLGESİNİ BULALIM',
                style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white)),
              )),
        ],
      ),
    );
  }
}
