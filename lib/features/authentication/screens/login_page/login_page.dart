import 'package:bootcamp_f32/features/authentication/screens/signup_page/signup_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../constants/colors.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obscureText = true;
  late AuthRepository _controller;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 0),
      () {
        _controller = AuthRepository(ref: ref);
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          child: Stack(
            children: [
              // arka plandaki şekiller
              const Positioned(
                top: 0,
                left: 0,
                child: SizedBox(
                    width: 65,
                    child: Image(
                      image:
                          AssetImage('assets/images/login_image/Ellipse 4.png'),
                    )),
              ),
              const Positioned(
                  left: 0,
                  bottom: 0,
                  child: Image(
                      image:
                          AssetImage('assets/images/login_image/Ellipse 1.png'))),
              const Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image(
                      image:
                          AssetImage('assets/images/login_image/Ellipse 3.png'))),
              const Positioned(
                  left: 0,
                  bottom: 0,
                  child: Image(
                      image:
                          AssetImage('assets/images/login_image/Ellipse 2.png'))),

              Form(
                key: _formKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // kitab animasyon
                        Lottie.asset(
                          'assets/animations/lottie_animations/book_animation.json',
                          width: 250,
                        ),

                        // hoşgeldin texti
                        Text(
                          'Giriş Yapın',
                          style: GoogleFonts.gluten(
                            textStyle: const TextStyle(
                              color: tBlackColor,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        //TextFeildler
                        SizedBox(
                          width: 320,
                          child: Column(
                            children: [
                              TextFormField(
                                //email
                                controller: _emailController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),

                                  prefixIcon: const Icon(
                                    Icons.email_outlined,
                                    color: tBlackColor,
                                  ),
                                  labelText: 'Email',
                                  hintText: 'Email',
                                  errorStyle: const TextStyle(fontSize: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          const BorderSide(color: tBlackColor)),
                                ),
                                validator: (email) {
                                  if (email != null &&
                                      !EmailValidator.validate(email)) {
                                    return 'Geçerli bir email girin';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _passwordController,
                                textInputAction: TextInputAction.done,
                                obscureText: obscureText,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.fingerprint,
                                    color: tBlackColor,
                                  ),
                                  hintText: 'Şifre',
                                  labelText: 'Şifre',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          const BorderSide(color: tBlackColor)),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(
                                        () {
                                          obscureText = !obscureText;
                                        },
                                      );
                                    },
                                    icon: obscureText
                                        ? const Icon(
                                            Icons.visibility_off,
                                            color: tBlackColor,
                                          )
                                        : const Icon(
                                            Icons.visibility,
                                            color: tBlackColor,
                                          ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Center(
                                child: SizedBox(
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _controller.signInWithEmailAndPassword(
                                            _emailController, _passwordController);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      foregroundColor: tWhiteColor,
                                      backgroundColor: tSecondaryColor,
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 12),
                                    ),
                                    child: const Text(
                                      'Giriş',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          'veya bunlarla giriş yap:',
                          style: GoogleFonts.comfortaa(
                              textStyle: const TextStyle(color: tBlackColor)),
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                _controller.signInWithFacebook();
                              },
                              child: const SizedBox(
                                  width: 80,
                                  child: Image(
                                    image:
                                        AssetImage('assets/logo/facebook_logo.png'),
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                _controller.signInWithGoogle();
                              },
                              child: const SizedBox(
                                  width: 80,
                                  child: Image(
                                    image:
                                        AssetImage('assets/logo/google_logo.png'),
                                  )),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        SizedBox(
                          width: 320,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => const SignupPage(),
                              ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: Divider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Buradan kayıt ol',
                                    style: GoogleFonts.comfortaa(
                                        textStyle:
                                            const TextStyle(color: tBlackColor)),
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Divider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
