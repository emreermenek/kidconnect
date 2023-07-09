import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class StoryPage9 extends StatefulWidget {
  const StoryPage9({super.key});

  @override
  State<StoryPage9> createState() => _StoryPage9State();
}

class _StoryPage9State extends State<StoryPage9> {
  bool isPlaying = true;
  final _player = AudioPlayer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player.setAsset(
        'assets/sounds/story_sounds/9 (enhanced).wav');
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
                      image: AssetImage('assets/images/story/on.png'),
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
                      const Image(image: AssetImage('assets/images/story/anlati9.png')),
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
