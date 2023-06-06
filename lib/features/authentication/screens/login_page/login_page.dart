import 'package:bootcamp_f32/features/authentication/screens/signup_page/signup_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 200,horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  TextFormField(  //email
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: 'Email',
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) {
                      if(email !=null && !EmailValidator.validate(email)){
                        return 'Geçerli bir email girin';
                      }else{
                        return null;
                      }
                    },
                  ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _passwordController,
                  textInputAction: TextInputAction.done,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.fingerprint),
                    hintText: 'Şifre',
                    labelText: 'Şifre',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: obscureText ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                    )
                  ),
                ),
                const SizedBox(height: 2,),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {

                  },
                      child: const Text('Şifreni mi unuttun?'),
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                      if(_formKey.currentState!.validate()){
                          _controller.signInWithEmailAndPassword(_emailController, _passwordController);
                      }
                  },
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Giriş Yap'),
                  ),
                ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                const SizedBox(height: 5,),
                const Text('VEYA'),
                const SizedBox(height: 5,),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    icon: const Image(image: AssetImage('assets/logo/google_logo.png'),width: 20,),
                    onPressed: () {
                        _controller.signInWithGoogle();
                    },
                    label: const Text('Google ile giriş yap'),
                  ),
                ),
                const SizedBox(height: 10,),
                TextButton(
                  onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignupPage(),));
                  },
                  child: const Text.rich(
                      TextSpan(
                          text: 'Hesabın yok mu?',
                          style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal
                          ),
                          children: [
                            TextSpan(
                              text: ' Kayıt yap',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ]
                      )
                  ),
                )
              ],
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
