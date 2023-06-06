
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../main.dart';
import '../../utils/utils.dart';

class AuthRepository{
  final WidgetRef ref;


  AuthRepository({
    required this.ref
    });


  Future<void> signInWithEmailAndPassword(TextEditingController email, TextEditingController password) async{

    showDialog(
      context: ref.context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator(),),
    );
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim()
      );
    } on FirebaseAuthException catch(e){
      Utils.showSnackBar(e.message);
    }
  }

  Future<void> createUserWithEmailAndPassword(TextEditingController email, TextEditingController password) async{

    showDialog(
      context: ref.context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator(),),
    );

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim()
      );
    } on FirebaseAuthException catch(e){
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }


  Future<UserCredential> signInWithGoogle() async {

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );


    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}

