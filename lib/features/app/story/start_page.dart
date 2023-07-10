import 'package:bootcamp_f32/features/app/story/page_flip.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryStartPage extends StatefulWidget {
  const StoryStartPage({super.key});

  @override
  State<StoryStartPage> createState() => _StoryStartPageState();
}

class _StoryStartPageState extends State<StoryStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1BDB2),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 390,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/story/bir.png'),
                  fit: BoxFit.fill
                )
              ),
            ),
          ),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 50,),
                    Container(
                      width: 344,
                      height: 326,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.white
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('  GİZEMLİ\nBENEKLER', style: GoogleFonts.comfortaa(
                            textStyle: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600
                            )
                          ),),
                          Padding(
                              padding: const EdgeInsets.all(24),
                            child: InkWell(
                              onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PageFlip(),));
                              },
                                child: const Image(image: AssetImage('assets/images/story/button.png'),)),
                          ),
                          Text('Haydi Hikaye\n  Dinleyelim!', style: GoogleFonts.comfortaa(
                              textStyle: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600
                              )
                          ),),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const Image(image: AssetImage('assets/images/story/cikis.png')),
              ),
            ),
          )
        ],
      ),
    );
  }
}
