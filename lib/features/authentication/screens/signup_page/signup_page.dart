import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../login_page/login_page.dart';
import '../../../../constants/colors.dart';


class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordVerifierController = TextEditingController();
  final _firstNameController = TextEditingController();
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
    _passwordVerifierController.dispose();
    _firstNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        child: Stack(children: [
          const Positioned(
              left: 0,
              bottom: 0,
              child: Image(
                  image: AssetImage('assets/images/singnup/Ellipse 6.png'))),
          const Positioned(
              right: 0,
              top: 0,
              child:
              Image(image: AssetImage('assets/images/singnup/Vector.png'))),
          Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Kayıt Olun',
                      style: GoogleFonts.gluten(
                          fontStyle: FontStyle.italic,
                          fontSize: 50,
                          textStyle: const TextStyle(
                              color: Color.fromARGB(235, 45, 46, 46))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 320,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _firstNameController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.login_outlined),
                              labelText: 'İsim Soyisim',
                              hintText: 'İsim Soyisim',
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your first name';
                              }
                              return null;
                            },
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            //email
                            controller: _emailController,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              labelText: 'Email',
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                            ),
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (email) {
                              if (email != null &&
                                  !EmailValidator.validate(email)) {
                                return 'Geçerli bir email girin';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            textInputAction: TextInputAction.done,
                            obscureText: obscureText,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.fingerprint),
                              hintText: 'Şifre',
                              labelText: 'Şifre',
                              border: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                icon: obscureText
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return 'Şifre en az 8 karakter olmalıdır!';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _passwordVerifierController,
                            textInputAction: TextInputAction.done,
                            obscureText: obscureText,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.fingerprint),
                              hintText: 'Şifre Doğrulama',
                              labelText: 'Şifre Doğrulama',
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                            ),
                            validator: (value) {
                              if (_passwordVerifierController.text !=
                                  _passwordController.text) {
                                return 'Şifreler uyuşmuyor!';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _controller.createUserWithEmailAndPassword(
                                        _emailController, _passwordController,_firstNameController);
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
                                  'Kayıt ol',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                'veya bunlarla giriş yap:',
                                style: GoogleFonts.comfortaa(
                                    textStyle:
                                    const TextStyle(color: tBlackColor)),
                              )),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  _controller.signInWithFacebook();
                                },
                                child: const SizedBox(
                                    width: 80,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/logo/facebook_logo.png'),
                                    )),
                              ),
                              InkWell(
                                onTap: () {
                                  _controller.signInWithGoogle();
                                },
                                child: const SizedBox(
                                    width: 80,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/logo/google_logo.png'),
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: 320,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ));
                              },
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
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
                                      'Hesabın var mı? Giriş yap',
                                      style: GoogleFonts.comfortaa(
                                          textStyle: const TextStyle(
                                              color: tBlackColor)),
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
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Image(image: AssetImage(
                      'assets/images/choose_correct_games/color_choose_correct_game_images/exit.png'))),
            ),
          ),
        ]),
      ),
    );
  }
}