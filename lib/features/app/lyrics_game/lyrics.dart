import 'package:flutter/material.dart';

class LyricsGame extends StatefulWidget {
  const LyricsGame({super.key});

  @override
  State<LyricsGame> createState() => _LyricsGameState();
}

class _LyricsGameState extends State<LyricsGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/lyrics_images/background.png'),
            fit: BoxFit.fill
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(height: 20,),
                Container(
                  height: 541,
                  width: 340,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/lyrics_images/box1.png'),
                      fit: BoxFit.fill
                    )
                  ),
                  child: const Center(
                    child: Text(''),
                  ),
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}
