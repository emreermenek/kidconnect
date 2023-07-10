import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class StoryPage10 extends StatefulWidget {
  const StoryPage10({super.key});

  @override
  State<StoryPage10> createState() => _StoryPage10State();
}

class _StoryPage10State extends State<StoryPage10> {
  bool isPlaying = true;
  final _player = AudioPlayer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player.setAsset(
        'assets/sounds/story_sounds/10 (enhanced).wav');
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
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 240,
                height: 185,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/story/onbiri.png'),
                        fit: BoxFit.fill
                    )
                ),
              ),
            ),
            Column(
              children: [
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
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Image(image: AssetImage('assets/images/story/anlati10.png')),
                        const SizedBox(height: 30,),
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

                        )
                      ],
                    ),
                  ],
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
