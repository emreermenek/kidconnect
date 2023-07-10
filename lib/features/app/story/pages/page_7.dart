import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class StoryPage7 extends StatefulWidget {
  const StoryPage7({super.key});

  @override
  State<StoryPage7> createState() => _StoryPage7State();
}

class _StoryPage7State extends State<StoryPage7> {
  bool isPlaying = true;
  final _player = AudioPlayer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player.setAsset(
        'assets/sounds/story_sounds/7 (enhanced).wav');
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const SizedBox(height: 50,),
                  Container(
                    width: 295,
                    height: 317,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/story/sekiz.png'),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        InkWell(
                            onTap: () async {
                              if(isPlaying){
                                setState(() {
                                  isPlaying = !isPlaying;
                                });
                                await _player.play();

                              }else {
                                setState(() {
                                  isPlaying = !isPlaying;
                                });
                                await _player.pause();

                              }

                            },
                            child: isPlaying ?
                            const Image(image: AssetImage('assets/images/story/play button.png'),) :
                            const Image(image: AssetImage('assets/images/story/stop button.png'),)

                        ),
                        const SizedBox(height: 30,),
                        const Image(image: AssetImage('assets/images/story/anlati7.png')),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30,)
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Image(image: AssetImage('assets/images/story/cikis.png'),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
