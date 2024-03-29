import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class StoryPage16 extends StatefulWidget {
  const StoryPage16({super.key});

  @override
  State<StoryPage16> createState() => _StoryPage16State();
}

class _StoryPage16State extends State<StoryPage16> {
  bool isPlaying = true;
  final _player = AudioPlayer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player.setAsset(
        'assets/sounds/story_sounds/16 (enhanced).wav');
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  const SizedBox(width: 15,),
                  Container(
                    width: 164,
                    height: 259,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/story/onyedi.png'),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                ],
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image(image: AssetImage('assets/images/story/anlati16.png')),

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
