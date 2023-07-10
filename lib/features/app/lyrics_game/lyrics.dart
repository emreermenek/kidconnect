import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LyricsGame extends StatefulWidget {
  const LyricsGame({super.key});

  @override
  State<LyricsGame> createState() => _LyricsGameState();
}

class _LyricsGameState extends State<LyricsGame> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    const url = 'https://www.youtube.com/watch?v=j_HwKWQ579c&ab_channel=Ay%C5%9Fe%27nin%C3%87ocukBah%C3%A7esi';
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!
    );
  }
  @override
  void deactivate() {
    controller.pause();

    super.deactivate();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
      ),
      builder: (context , player ) => SafeArea(
        child: SafeArea(
          child: Scaffold(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10,),
                      Container(
                        height: 541,
                        width: 340,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/lyrics_images/box1.png'),
                            fit: BoxFit.fill
                          )
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 120,),
                            SizedBox(
                              width: 300,
                                child: player
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Image(image: AssetImage('assets/images/lyrics_images/back.png'),width: 60,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
