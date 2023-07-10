import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComingSoonScreen extends StatefulWidget {
  const ComingSoonScreen({super.key});

  @override
  State<ComingSoonScreen> createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEFE080),
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                          child: const Image(image: AssetImage('assets/images/coming_soon_screen_images/exit.png'),)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Image(image: AssetImage('assets/images/coming_soon_screen_images/logo.png'),)),
                  ),
                  const SizedBox(height: 200,),
                  const Divider(
                    height: 7,
                    thickness: 3.5,
                    color:  Color(0xFFFF511A)
                  ),
                  const Divider(
                      height: 7,
                      thickness: 3.5,
                      color:  Color(0xFFFF511A)
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Çok yakında burada..', style: GoogleFonts.gluten(
                        textStyle: const TextStyle(
                          color: Color(0xFFFF511A),
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        )
                      ),)
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Divider(
                      height: 7,
                      thickness: 3.5,
                      color:  Color(0xFFFF511A)
                  ),
                  const Divider(
                      height: 7,
                      thickness: 3.5,
                      color:  Color(0xFFFF511A)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
