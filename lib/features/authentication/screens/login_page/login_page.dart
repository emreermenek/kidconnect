import 'package:bootcamp_f32/features/authentication/screens/signup_page/signup_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height*0.41,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 65.w,
                            child: Positioned(
                              top: 0.h,
                              left: 0.w,
                              child: const Image(image: AssetImage('assets/images/login_image/Ellipse 4.png'),),
                            ),
                          ),
                          Positioned(
                            top: 60.h,
                            left: 100.w,
                            child: Lottie.asset(
                              'assets/animations/lottie_animations/book_animation.json',
                              width: 270.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 220.h,
                        left: 65.w,
                        child: Text(
                          'Hoşgeldiniz',
                          textScaleFactor: 1.0,
                          style: GoogleFonts.gluten(
                            textStyle: TextStyle(color: tBlackColor, fontSize: 45.sp,fontWeight: FontWeight.bold,),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40.w,vertical: 5.h),
                  child: SizedBox(
                    height: 173.h,
                    child: Column(
                      children: [
                        SizedBox(height: 3.h,),
                        SizedBox(
                          height: 50.h,
                          child: TextFormField(  //email
                            controller: _emailController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email_outlined,color: tBlackColor,),
                              labelText: 'Email',
                              hintText: 'Email',
                              errorStyle: TextStyle(fontSize: 10.sp),
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
                        SizedBox(height: 10.h,),
                        SizedBox(
                          height: 50.h,
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
                        SizedBox(height: 10.h,),
                        SizedBox(
                          width: 80.w,
                          height: 40.h,
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
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                            ),
                            child: Text('Giriş',style: TextStyle(fontSize: 15.sp),),
                          ),
                        ),
                        SizedBox(height: 10.h,),
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
                          height: 80.h,
                          left: 0.w,
                          bottom: 0.h,
                          child: const Image(image: AssetImage('assets/images/login_image/Ellipse 1.png'))
                      ),
                      Positioned(
                          height: 225.h,
                          right: 0.w,
                          bottom: 0.h,
                          child: const Image(image: AssetImage('assets/images/login_image/Ellipse 3.png'))
                      ),
                      Positioned(
                          left: 0.w,
                          bottom: 0.h,
                          child: const Image(image: AssetImage('assets/images/login_image/Ellipse 2.png'))
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
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
                                      width: 80.w,
                                      child: const Image(image: AssetImage('assets/logo/facebook_logo.png'),)
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _controller.signInWithGoogle();
                                  },
                                  child: SizedBox(
                                      width: 80.w,
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
    );
  }
}