
import 'package:bootcamp_f32/features/app/shape_match_game/data/offset.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bootcamp_f32/common_widgets/bottom_navigation_bar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../constants/colors.dart';
import '../settings_page/settings_page.dart';
import 'appbar_profile_page.dart';
import 'appbar_welcome_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF07E74),
        bottomNavigationBar: botNavBar(currentIndex: 1, context: context),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child:  StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return const AppBarClient();
                  }else {
                    return const AppBarUser();
                  }
                },
                ),
            ),
        body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Container(
                  height: 627,
                  width: 346,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                  child: StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return const Center(child: CircularProgressIndicator(),);
                      }else if(snapshot.hasError){
                        return const Center(child: Text("Bir şeyler yanlış gitti!"),);
                      }else if(snapshot.hasData){
                        return Profile2();
                      }else {
                        return WelcomePage();
                      }
                    },
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }
}

class Profile2 extends StatelessWidget {
  const Profile2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 25),
          Image.asset("assets/images/profile_page/user (1).png", height: 154),
          SizedBox(height: 25),
          Container(
            height: 160,
            width: 300,
            decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.all(
                    Radius.circular(20))
            ),
            child: Stack(
              children: [
                Center(
                  child: Container(height: 150, width: 270,
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            buildText("AD SOYAD      :"),
                            SizedBox(height: 5,),
                            buildText("YAŞ                 :"),
                            SizedBox(height: 5,),
                            buildText("CİNSİYET        :"),
                            SizedBox(height: 5,),
                            buildText("ACİL DURUM\nNUMARALARI :"),
                          ],
                        ),
                        SizedBox(width: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildText("AD SOYADI"),
                            SizedBox(height: 10,),
                            buildText("YAŞ"),
                            SizedBox(height: 10,),
                            buildText("CİNSİYET"),
                            SizedBox(height: 10),
                            buildText("ACİL DURUM NO")
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 160,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4FCBE9),


                    ), onPressed: () {

                }, child: Text(
                  "GÜNCELLE",
                  style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),),
                ),
              ),
              SizedBox(width: 5,),
              SizedBox(
                width: 160,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4FCBE9),
                    ), onPressed: () {

                }, child: Text(
                  "TAKİP SAYFASI",
                  style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),)
                ),
              ),
            ],
          ),
          SizedBox(height: 52,),
          Image.asset("assets/images/profile_page/Group 32.png", width: 326.36, height: 136,),
        ],
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Align(
              alignment:Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 43, top: 5),
                child: Image.asset("assets/images/profile_page/balloons (2).png", height: 75,),
              )),

          Text(
            "WELCOME TO\nYOUR PROFILE",
            style: TextStyle(color: tBlackColor, fontWeight: FontWeight.bold, fontSize: 30),
          ),

          Container(
            height: 162,
            width: 300,
            child: Stack(
              children: [
                Positioned(
                  bottom:0,left: 15,
                  child: Container(
                    width: 274,
                    height: 107,
                    decoration: BoxDecoration(
                        color: Color(0xFF4FCBE9),
                        borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, ),
                      child:
                      Text(
                        "KAYIT OLUŞTURARAK ETKİNLİKLERDEKİ İLERLEMEYİ GÖREBİLİRSİN",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Positioned(right: 0,
                    child: Image.asset("assets/images/profile_page/air-hot-balloon.png", width: 94,)),
              ],
            ),
          ),
          SizedBox(height: 5,),
          TextButton(onPressed: () {

          }, child: buildText("KAYIT OLMAK İÇİN DOKUN!",),),

         Container(
           width: 270,
           height: 246,
           child: Stack(
             children: [
               Positioned(
                 bottom:-7.5,
                   child: Image.asset("assets/images/profile_page/cimvecicek.png", width: 300,height: 100)),
               Center(child: Image.asset("assets/images/profile_page/Asset 13.png", height: 220, width: 150,)),
             ],
           ),
         ),
        ],
      ),
    );
  }
}

Text buildText(String text)
=> Text(text, style: GoogleFonts.quicksand(textStyle:  TextStyle(color: tBlackColor, fontWeight: FontWeight.bold, fontSize: 15)));


