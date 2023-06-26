import 'package:bootcamp_f32/features/app/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:bootcamp_f32/features/authentication/screens/signup_page/signup_page.dart';
import '../../../../../../constants/colors.dart';

class FirstPage extends ConsumerStatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  ConsumerState<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends ConsumerState<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        child: Stack(children: [
          const Positioned(
              left: 0,
              top: 0,
              child: Image(
                  image:
                      AssetImage('assets/images/first-page/Rectangle 1.png'))),
          const Positioned(
              right: 0,
              top: 0,
              child: Image(
                  image:
                      AssetImage('assets/images/first-page/Rectangle 2.png'))),
          const Positioned(
              right: 0,
              bottom: 0,
              child: Image(
                  image: AssetImage('assets/images/first-page/Vector 1.png'))),
          const Positioned(
              left: 0,
              bottom: 50,
              child: Image(
                  image: AssetImage('assets/images/first-page/Vector 2.png'))),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Lottie.asset(
                    'assets/animations/lottie_animations/lf20_lc46h4dr.json',
                    width: 250,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Hoşgeldiniz',
                    style: GoogleFonts.gluten(
                        fontStyle: FontStyle.italic,
                        fontSize: 50,
                        textStyle:
                            const TextStyle(color: Color.fromARGB(235, 45, 46, 46))),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 320,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) => const SignupPage(),
                                  ));
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  foregroundColor: tWhiteColor,
                                  backgroundColor: tErrorColor,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                ),
                                child: const Text(
                                  'Kayıt ol',
                                  style: TextStyle(fontSize: 15, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ));
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  foregroundColor: tWhiteColor,
                                  backgroundColor: tErrorColor,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                ),
                                child: const Text(
                                  'Misafir Girişi',
                                  style: TextStyle(fontSize: 15, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
