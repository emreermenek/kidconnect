import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../login_page/login_page.dart';

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
            Positioned(
                left: 0,
                bottom: 0,
                child:
                    Image(image: AssetImage('assets/singnup/Ellipse 6.png'))),
            Positioned(
                right: 0,
                top: 0,
                child: Image(image: AssetImage('assets/singnup/Vector.png'))),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Kayıt Olun',
                        style: GoogleFonts.gluten(
                            fontStyle: FontStyle.italic,
                            fontSize: 50,
                            textStyle: TextStyle(
                                color: Color.fromARGB(235, 45, 46, 46))),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 32),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25))),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25))),
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
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25))),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25))),
                                    ),
                                    validator: (value) {
                                      if (_passwordVerifierController.text !=
                                          _passwordController.text) {
                                        return 'Şifreler uyuşmuyor!';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      width: 150,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _controller
                                                .createUserWithEmailAndPassword(
                                                    _emailController,
                                                    _passwordController);
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25))),
                                            fixedSize: Size(50, 60),
                                            foregroundColor: Colors.white,
                                            backgroundColor:
                                                Colors.blue.shade900,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16)),
                                        child: const Text('Kayıt ol'),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Align(
                                      child: Text(
                                        'veya unlarla giriş yapın',
                                        style: GoogleFonts.comfortaa(
                                            fontSize: 12,
                                            textStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    235, 45, 46, 46))),
                                      ),
                                      alignment: Alignment.center),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: const Image(
                                          image: AssetImage(
                                              'assets/singnup/icons8-facebook-100.png'),
                                          width: 90,
                                          height: 90,
                                        ),
                                        onPressed: () async {
                                          final result = await FacebookAuth
                                              .instance
                                              .login();

                                          switch (result.status) {
                                            case LoginStatus.success:
                                              final accessToken =
                                                  result.accessToken!;
                                              // Use the access token to authenticate the user or perform other tasks
                                              print('Logged in successfully!');
                                              break;
                                            case LoginStatus.cancelled:
                                              print('Login cancelled by user');
                                              break;
                                            case LoginStatus.failed:
                                              print('Facebook login failed');
                                              print(
                                                  'Error message: ${result.message}');
                                              break;
                                            default:
                                              print(
                                                  'Unhandled login status: ${result.status}');
                                          }
                                        },
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          _controller.signInWithGoogle();
                                        },
                                        icon: const Image(
                                          image: AssetImage(
                                              'assets/singnup/icons8-google-100.png'),
                                          width: 90,
                                          height: 90,
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                        builder: (context) => const LoginPage(),
                                      ));
                                    },
                                    child: Align(
                                        child: Text.rich(TextSpan(
                                            text: 'Hesabın var mı?',
                                            style: GoogleFonts.comfortaa(
                                                fontSize: 12,
                                                textStyle: TextStyle(
                                                    color: Color.fromARGB(
                                                        235, 45, 46, 46))),
                                            children: [
                                              TextSpan(
                                                text: 'Giriş yap',
                                                style: GoogleFonts.comfortaa(
                                                    fontSize: 12,
                                                    textStyle: TextStyle(
                                                        color: Colors.blue)),
                                              ),
                                            ])),
                                        alignment: Alignment.center),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
