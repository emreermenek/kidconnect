import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextVocalize extends StatefulWidget {
  const TextVocalize({super.key});

  @override
  State<TextVocalize> createState() => _TextVocalizeState();
}

class _TextVocalizeState extends State<TextVocalize> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/text_vocalizing_images/en son.png'),
              fit: BoxFit.fill
            ),
          ),
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.bottomCenter,
                child: Image(image: AssetImage('assets/images/text_vocalizing_images/soru balonlu kaplan.png')),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text('      Fotoğraf\nMakinesine Dokun\nDinlemek İstediğin\n      Yazıyı Çek',style: GoogleFonts.gluten(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                              )
                            ),
                            ),
                            const SizedBox(height: 30,),
                            InkWell(
                              onTap: () {

                              },
                              child: const Image(image: AssetImage('assets/images/text_vocalizing_images/camera 1.png'),),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
