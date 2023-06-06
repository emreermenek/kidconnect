import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    _passwordVerifierController.dispose();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
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
                      ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 8) {
                      return 'Şifre en az 8 karakter olmalıdır!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _passwordVerifierController,
                  textInputAction: TextInputAction.done,
                  obscureText: obscureText,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.fingerprint),
                      hintText: 'Şifre Doğrulama',
                      labelText: 'Şifre Doğrulama',
                      border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (_passwordVerifierController.text != _passwordController.text) {
                      return 'Şifreler uyuşmuyor!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        _controller.createUserWithEmailAndPassword(_emailController, _passwordController);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16)
                    ),
                    child: const Text('Kayıt ol'),
                  ),
                ),
                const SizedBox(height: 5),
                const Text('VEYA'),
                const SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      _controller.signInWithGoogle();
                    },
                    icon: const Image(image: AssetImage('assets/logo/google_logo.png'),width: 20,),
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        foregroundColor: Colors.black,
                        side: const BorderSide(color: Colors.black),
                        padding: const EdgeInsets.symmetric(vertical: 16)
                    ),
                    label: const Text('Google ile giriş yap'),
                  ),
                ),
                const SizedBox(height: 10,),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage(),));
                  },
                  child: const Text.rich(
                      TextSpan(
                          text: 'Hesabın var mı?',
                          style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal
                          ),
                          children: [
                            TextSpan(
                              text: 'Giriş yap',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ]
                      )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
