import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class StoryPage6 extends StatefulWidget {
  const StoryPage6({super.key});

  @override
  State<StoryPage6> createState() => _StoryPage6State();
}

class _StoryPage6State extends State<StoryPage6> {
  bool isPlaying = true;
  final _player = AudioPlayer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player.setAsset(
        'assets/sounds/story_sounds/6 (enhanced).wav');
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
                width: double.infinity,
                height: 384,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/story/bir.png'),
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
                        const Image(image: AssetImage('assets/images/story/anlati6.png')),
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
