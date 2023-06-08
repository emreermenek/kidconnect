

import 'package:bootcamp_f32/features/authentication/screens/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }else if(snapshot.hasError){
          return const Center(child: Text("Bir şeyler yanlış gitti!"),);
        }else if(snapshot.hasData){
          return const LoginPage();
        }else {
          return const LoginPage();
        }
      },
    );
  }
}