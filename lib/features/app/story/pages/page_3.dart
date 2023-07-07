import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class StoryPage3 extends StatefulWidget {
  const StoryPage3({super.key});

  @override
  State<StoryPage3> createState() => _StoryPage3State();
}

class _StoryPage3State extends State<StoryPage3> {
  bool isPlaying = true;
  final _player = AudioPlayer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player.setFilePath(
        'assets/sounds/story_sounds/3 (enhanced).wav');
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const SizedBox(height: 50,),
                Container(
                  width: 311,
                  height: 289,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/story/alti.png'),
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
                      const Image(image: AssetImage('assets/images/story/anlati3.png')),
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
    );
  }
}
