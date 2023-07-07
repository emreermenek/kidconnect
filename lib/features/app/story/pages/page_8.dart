import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class StoryPage8 extends StatefulWidget {
  const StoryPage8({super.key});

  @override
  State<StoryPage8> createState() => _StoryPage8State();
}

class _StoryPage8State extends State<StoryPage8> {
  bool isPlaying = true;
  final _player = AudioPlayer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player.setFilePath(
        'assets/sounds/story_sounds/8 (enhanced).wav');
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
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 365,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/story/dokuz.png'),
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
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Image(image: AssetImage('assets/images/story/anlati8.png')),
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
    );
  }
}
