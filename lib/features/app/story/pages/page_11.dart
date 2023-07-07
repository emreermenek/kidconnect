import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class StoryPage11 extends StatefulWidget {
  const StoryPage11({super.key});

  @override
  State<StoryPage11> createState() => _StoryPage11State();
}

class _StoryPage11State extends State<StoryPage11> {
  bool isPlaying = false;
  final _player = AudioPlayer();

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
              width: 209,
              height: 214,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/story/oniki.png'),
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
                      const Image(image: AssetImage('assets/images/story/anlati11.png')),
                      const SizedBox(height: 30,),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                        child: isPlaying ?
                        const Image(image: AssetImage('assets/images/story/stop button.png'),) :
                        const Image(image: AssetImage('assets/images/story/play button.png'),),
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
