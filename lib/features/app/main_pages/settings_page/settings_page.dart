import 'package:bootcamp_f32/common_widgets/bottom_navigation_bar_widget.dart';
import 'package:bootcamp_f32/features/authentication/screens/signup_page/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../repository/authentication_repository/authentication_repository.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool isNotificationOpen = false;
  bool isMusicOpen = false;
  late AuthRepository _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 0),
          () {
        _controller = AuthRepository(ref: ref);
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF4FCBE9),
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 75,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage('assets/images/settings_image/gear.png'),width: 70,),
              const SizedBox(width: 5,),
              Text('AYARLAR',style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ) ),
            ],
          ),
        ),
        bottomNavigationBar: botNavBar(currentIndex: 2,context: context),
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }else if(snapshot.hasError){
              return const Center(child: Text("Bir şeyler yanlış gitti!"),);
            }else if(snapshot.hasData && !FirebaseAuth.instance.currentUser!.emailVerified){
              FirebaseAuth.instance.currentUser!.reload();
              return signedIn();
            }else if(snapshot.hasData && FirebaseAuth.instance.currentUser!.emailVerified){
              return verifiedSignedIn();
            }else {
              return guest();
            }
          },
        ),
      ),
    );
  }
/*
-----------------------------------------------------------------------------------------
                  Signed in and verified Page
-----------------------------------------------------------------------------------------
*/
  SizedBox verifiedSignedIn() {
    return SizedBox(
        child: Stack(
            children: [
              const Align(
                  alignment: Alignment.bottomCenter,
                  child: Image(image: AssetImage('assets/images/settings_image/il.png'),width: 250,)
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30,),
                    const Image(image: AssetImage('assets/images/settings_image/happy tiger.png'),width: 270,height: 170,),
                    Center(
                      child: Container(
                        width: 300,
                        height: 260,
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 30,),
                            Row(
                              children: [
                                const Image(image: AssetImage('assets/images/settings_image/notification-bell.png'),width: 40,),
                                const SizedBox(width: 15,),
                                Text('BİLDİRİM',style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ) ),
                                const SizedBox(width: 15,),
                                FlutterSwitch(
                                    width: 45.0,
                                    height: 25.0,
                                    padding: 3,
                                    value: isNotificationOpen,
                                    onToggle: (val) {
                                      setState(() {

                                        isNotificationOpen = val;
                                      });

                                    }
                                ),
                              ],
                            ),
                            const SizedBox(height: 30,),
                            Row(
                              children: [
                                const Image(image: AssetImage('assets/images/settings_image/log-out.png'),width: 40,),
                                const SizedBox(width: 20,),
                                InkWell(
                                  onTap: () {
                                    _controller.signOut();
                                  },
                                  child: Text('ÇIKIŞ YAP',style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ) ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]
        )
    );
  }
/*
-----------------------------------------------------------------------------------------
                  Signed in but not verified Page
-----------------------------------------------------------------------------------------
*/
  SizedBox signedIn() {
    return SizedBox(
      child: Stack(
        children: [
          const Align(
              alignment: Alignment.bottomCenter,
              child: Image(image: AssetImage('assets/images/settings_image/il.png'),width: 250,)
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15,),
                const Image(image: AssetImage('assets/images/settings_image/happy tiger.png'),width: 180),
                Center(
                  child: Container(
                    width: 300,
                    height: 330,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 30,),
                        Row(
                          children: [
                            const Image(image: AssetImage('assets/images/settings_image/notification-bell.png'),width: 40,),
                            const SizedBox(width: 15,),
                            Text('BİLDİRİM',style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ) ),
                            const SizedBox(width: 15,),
                            FlutterSwitch(
                                width: 45.0,
                                height: 25.0,
                                padding: 3,
                                value: isNotificationOpen,
                                onToggle: (val) {
                                  setState(() {
                                    isNotificationOpen = val;
                                  });

                                }
                            ),
                          ],
                        ),
                        const SizedBox(height: 30,),
                        Row(
                          children: [
                            const Image(image: AssetImage('assets/images/settings_image/customer.png'),width: 40,),
                            const SizedBox(width: 10,),
                            InkWell(
                              onTap: () {
                                  _controller.sendVerificationEmail();
                              },
                              child: Text('HESABINI AKTİF ET',style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ) ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30,),
                        Row(
                          children: [
                            const Image(image: AssetImage('assets/images/settings_image/log-out.png'),width: 40,),
                            const SizedBox(width: 20,),
                            InkWell(
                              onTap: () {
                                  _controller.signOut();
                              },
                              child: Text('ÇIKIŞ YAP',style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ) ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
          ),
      ]
    )
    );
  }
/*
-----------------------------------------------------------------------------------------
                  Guest Page
-----------------------------------------------------------------------------------------
*/
  SizedBox guest() {
    return SizedBox(
        child: Stack(
          children: [
            const Align(
                alignment: Alignment.bottomCenter,
                child: Image(image: AssetImage('assets/images/settings_image/il.png'),width: 250,)
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 15,),
                  const Image(image: AssetImage('assets/images/settings_image/happy tiger.png'),width: 180),
                  Center(
                    child: Container(
                      width: 300,
                      height: 180,
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 30,),
                          Row(
                            children: [
                              const Image(image: AssetImage('assets/images/settings_image/notification-bell.png'),width: 40,),
                              const SizedBox(width: 15,),
                              Text('BİLDİRİM',style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ) ),
                              const SizedBox(width: 15,),
                              FlutterSwitch(
                                  width: 45.0,
                                  height: 25.0,
                                  padding: 3,
                                  value: isNotificationOpen,
                                  onToggle: (val) {
                                    setState(() {

                                    isNotificationOpen = val;
                                    });

                                  }
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignupPage(),));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)
                        )
                    ),
                    child:  Text('KAYIT OL',style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ) ),
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _controller.signInWithFacebook();
                        },
                        child: const Image(
                          image:
                          AssetImage('assets/logo/facebook_logo.png'),
                        ),
                      ),
                      const SizedBox(width: 30,),
                      InkWell(
                        onTap: () {
                          _controller.signInWithGoogle();
                        },
                        child: const Image(
                          image:
                          AssetImage('assets/logo/google_logo.png'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      );
  }

}
