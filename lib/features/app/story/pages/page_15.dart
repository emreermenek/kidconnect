import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class StoryPage15 extends StatefulWidget {
  const StoryPage15({super.key});

  @override
  State<StoryPage15> createState() => _StoryPage15State();
}

class _StoryPage15State extends State<StoryPage15> {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                  child: isPlaying ?
                  const Image(image: AssetImage('assets/images/story/stop button.png'),) :
                  const Image(image: AssetImage('assets/images/story/play button.png'),),
                ),
                const SizedBox(width: 15,),
                Container(
                  width: 209,
                  height: 299,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/story/onalti.png'),
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
                      Image(image: AssetImage('assets/images/story/anlati15a.png')),

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
