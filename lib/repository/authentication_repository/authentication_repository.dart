
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../main.dart';
import '../../utils/utils.dart';

class AuthRepository{
  final WidgetRef ref;


  AuthRepository({
    required this.ref
    });

/*
---------------------------------------------------------------------------------------------
        Sign in with email with password
---------------------------------------------------------------------------------------------
*/
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
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
/*
---------------------------------------------------------------------------------------------
        Sign up with email with password
---------------------------------------------------------------------------------------------
*/
  Future<void> createUserWithEmailAndPassword(TextEditingController email, TextEditingController password, TextEditingController name) async{

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

      final docUser = FirebaseFirestore.instance.collection('users').doc();
      final json = {

        'id': docUser.id,
        'imageUrl': '',
        'name': name.text.trim(),
        'email': email.text.trim()

      };
      await docUser.set(json);

    } on FirebaseAuthException catch(e){
      var content = '';

      switch (e.code){
        case "account-exists-with-different-credential":
          content = 'bu hesap farklı oturum açma sağlayıcısı ile mevcut';
          break;
        case 'invalid-credantial':
          content = 'Bilinmeyen bir hata oldu';
          break;
        case 'user-disabled':
          content = 'Kullanılmaya çalışılan hesap devre dışı';
          break;
        case 'user-not-found':
          content = 'Kullanıcı bulunamadı';
          break;
      }
      Utils.showSnackBar(content);
    } catch(e){
      Utils.showSnackBar('Bilinmeyen bir hata oluştu');
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

/*
---------------------------------------------------------------------------------------------
        Sign in with Google
---------------------------------------------------------------------------------------------
*/
  Future<void> signInWithGoogle() async {

    showDialog(
      context: ref.context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator(),),
    );

    try{

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
        return;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      final docUser = FirebaseFirestore.instance.collection('users').doc();
      final json = {

        'id': docUser.id,
        'imageUrl': googleUser.photoUrl,
        'name': googleUser.displayName,
        'email': googleUser.email

      };
      await docUser.set(json);

    } on FirebaseAuthException catch(e){
      var content = '';

      switch (e.code){
        case "account-exists-with-different-credential":
          content = 'bu hesap farklı oturum açma sağlayıcısı ile mevcut';
          break;
        case 'invalid-credantial':
          content = 'Bilinmeyen bir hata oldu';
          break;
        case 'user-disabled':
          content = 'Kullanılmaya çalışılan hesap devre dışı';
          break;
        case 'user-not-found':
          content = 'Kullanıcı bulunamadı';
          break;
      }
      Utils.showSnackBar(content);
    } catch(e){
      Utils.showSnackBar('Bilinmeyen bir hata oluştu');
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
/*
---------------------------------------------------------------------------------------------
        Sign in with Facebook
---------------------------------------------------------------------------------------------
*/
  Future<void> signInWithFacebook() async {

    showDialog(
      context: ref.context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator(),),
    );

    try{
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      final accessToken = loginResult.accessToken;
      if(accessToken != null){
        final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
        await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

        final docUser = FirebaseFirestore.instance.collection('users').doc();
        final json = {

          'id': docUser.id,
          'imageUrl': userData['picture']['data']['url'],
          'name': userData['name'],
          'email': userData['email']

        };

        await docUser.set(json);
      }


    } on FirebaseAuthException catch(e){
      var content = '';

      switch (e.code){
        case "account-exists-with-different-credential":
          content = 'bu hesap farklı oturum açma sağlayıcısı ile mevcut';
          break;
        case 'invalid-credantial':
          content = 'Bilinmeyen bir hata oldu';
          break;
        case 'user-disabled':
          content = 'Kullanılmaya çalışılan hesap devre dışı';
          break;
        case 'user-not-found':
          content = 'Kullanıcı bulunamadı';
          break;
      }
      Utils.showSnackBar(content);
    } catch(e){
      Utils.showSnackBar('Bilinmeyen bir hata oluştu');
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
/*
---------------------------------------------------------------------------------------------
        Verify Email
---------------------------------------------------------------------------------------------
*/
  Future sendVerificationEmail() async {

    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      await Future.delayed(const Duration(seconds: 5));
    } on FirebaseAuthException catch(e){
      Utils.showSnackBar(e.message);
    }
  }
/*
---------------------------------------------------------------------------------------------
        Sign Out
---------------------------------------------------------------------------------------------
*/
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
}

/*
---------------------------------------------------------------------------------------------
        Sign Out
---------------------------------------------------------------------------------------------
*/


}

