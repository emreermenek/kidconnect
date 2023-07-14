import 'package:bootcamp_f32/features/app/main_pages/home_page/home_page.dart';
import 'package:bootcamp_f32/features/app/opening_page/opening_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Bir şeyler yanlış gitti!"),
          );
        } else if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const FirstPage();
        }
      },
    );
  }
}
