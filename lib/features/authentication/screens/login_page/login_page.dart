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
    Future.delayed(const Duration(seconds: 0), () {
      _controller = AuthRepository(ref: ref);
    },);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final mq =
    MediaQuery.of(context); //mediaQuery'i alıyoruz MyApp->Details içinden
    final screenSize = mq.size; //screenSize'ı alıyoruz
    final desiredWidth = 350.0; //hangi boyuta göre tasarladıysak onu veriyoruz.
    final ratio = screenSize.width / desiredWidth; // oran buluyoruz
    return SafeArea(
      child: FractionallySizedBox(
        widthFactor: 1 / ratio,
        heightFactor: 1/ ratio,
        child: Transform.scale(
          scale: ratio,
          child: MediaQuery(
            data: mq.copyWith(
              viewInsets: mq.viewInsets.copyWith(
                bottom: mq.viewInsets.bottom/ratio
              )
            ),
            child: Scaffold(
              body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 13/9,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              top: 0,
                              left: 0,
                              child: SizedBox( width: 65,child: const Image(image: AssetImage('assets/images/login_image/Ellipse 4.png'),)),
                            ),
                            Positioned(
                              top: 15,
                              left: 60,
                              child: Lottie.asset(
                                'assets/animations/lottie_animations/book_animation.json',
                                width: 200,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              top: 170,
                              left: 50,
                              child: Text(
                                'Hoşgeldiniz',

                                style: GoogleFonts.gluten(
                                  textStyle: TextStyle(color: tBlackColor, fontSize: 40,fontWeight: FontWeight.bold,),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                        child: SizedBox(
                          height: 173,
                          child: Column(
                            children: [
                              SizedBox(height: 3,),
                              SizedBox(
                                height: 50,
                                child: TextFormField(  //email
                                  controller: _emailController,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.email_outlined,color: tBlackColor,),
                                    labelText: 'Email',
                                    hintText: 'Email',
                                    errorStyle: TextStyle(fontSize: 10),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: const BorderSide(color: tBlackColor)
                                    ),

                                  ),
                                  validator: (email) {
                                    if(email !=null && !EmailValidator.validate(email)){
                                      return 'Geçerli bir email girin';
                                    }else{
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: 10,),
                              SizedBox(
                                height: 50,
                                child: TextFormField(
                                  controller: _passwordController,
                                  textInputAction: TextInputAction.done,
                                  obscureText: obscureText,
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.fingerprint, color: tBlackColor,),
                                      hintText: 'Şifre',
                                      labelText: 'Şifre',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(25),
                                          borderSide: const BorderSide(color: tBlackColor)
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            obscureText = !obscureText;
                                          });
                                        },
                                        icon: obscureText ? const Icon(Icons.visibility_off, color: tBlackColor,) : const Icon(Icons.visibility, color: tBlackColor,),
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              SizedBox(
                                width: 80,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if(_formKey.currentState!.validate()){
                                      _controller.signInWithEmailAndPassword(_emailController, _passwordController);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                    foregroundColor: tWhiteColor,
                                    backgroundColor: tSecondaryColor,
                                    padding: EdgeInsets.symmetric(vertical: 1),
                                  ),
                                  child: Text('Giriş',style: TextStyle(fontSize: 15),),
                                ),
                              ),
                              SizedBox(height: 10,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height*0.3,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                                height: height*0.1,
                                left: 0,
                                bottom: 0,
                                child: const Image(image: AssetImage('assets/images/login_image/Ellipse 1.png'))
                            ),
                            Positioned(
                                height: height*0.3,
                                right: 0,
                                bottom: 0,
                                child: const Image(image: AssetImage('assets/images/login_image/Ellipse 3.png'))
                            ),
                            Positioned(
                                left: 0,
                                bottom: 0,
                                child: const Image(image: AssetImage('assets/images/login_image/Ellipse 2.png'))
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Column(
                                children: [
                                  Text(
                                    'veya bunlarla giriş yap:',
                                    style: GoogleFonts.comfortaa(
                                        textStyle: const TextStyle(color: tBlackColor)
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          _controller.signInWithFacebook();
                                        },
                                        child: SizedBox(
                                            width: 80,
                                            child: const Image(image: AssetImage('assets/logo/facebook_logo.png'),)
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _controller.signInWithGoogle();
                                        },
                                        child: SizedBox(
                                            width: 80,
                                            child: const Image(image: AssetImage('assets/logo/google_logo.png'),)
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignupPage(),));
                                    },
                                    child: Text(
                                      'Buradan kayıt ol',
                                      style: GoogleFonts.comfortaa(
                                          textStyle: const TextStyle(color: tBlackColor)
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}