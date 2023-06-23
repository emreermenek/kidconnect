import 'package:bootcamp_f32/features/app/shape_match_game/data/offset.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class ProfileUserOpen extends StatefulWidget {
  const ProfileUserOpen({super.key});

  @override
  State<ProfileUserOpen> createState() => _ProfileUserOpenState();
}

class _ProfileUserOpenState extends State<ProfileUserOpen> {
  var googleFont = Font();


  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double screenHeight = screen.size.height;
    final double screenWidth = screen.size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF07E74),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  width: 70,
                  height: 80,
                  child: buildImage("windmill 1.png"),
                ),
              ),

              Text("PROFİL", style: googleFont.font1,),
              SizedBox(width: 58, height: 64,
                  child: buildImage("balloons (1).png")),
            ],
          ),
        ),
        bottomNavigationBar: botNavBar(currentIndex: 1,context: context),
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData && !FirebaseAuth.instance.currentUser!.emailVerified){
              FirebaseAuth.instance.currentUser!.reload();
              return WelcomePage();
            }else {
              return ProfilePage();
            }
          },
        ),
      ),
    );
  }

  Image buildImage(String picture) => Image.asset("assets/images/profile_page/$picture");
}

class WelcomePage extends StatelessWidget {
  var googleFont = Font();
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double screenHeight = screen.size.height;
    final double screenWidth = screen.size.width;
    return Center(
      child: Column(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: SizedBox(
                    width: screenWidth,
                    child: Container(
                      height: 627,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 42,right: 190),
            child: SizedBox(
                width: 82,
                child: buildImage("balloons (2).png")
            ),
          ),
          Text("WELCOME TO\nYOUR PROFILE", style: googleFont.font2, textAlign: TextAlign.center,),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 40),
                child: Container(
                  width: 274,
                  height: 107,
                  decoration: BoxDecoration(
                      color: Color(0xFF4FCBE9),
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text("KAYIT OLUŞTURARAK ETKİNLİKLERDEKİ İLERLEMEYİ GÖREBİLİRSİN", style: googleFont.font3, textAlign: TextAlign.center),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 250,),
                child: SizedBox(width:94, child: buildImage("air-hot-balloon.png")),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top:3),
            child: TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
            }, child: Text("KAYIT OLMAK İÇİN DOKUN!", style: googleFont.font4,)),
          ),
          LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
            if(constraints.maxWidth < 600 ){
              return Picture1();
            }else{
              return Picture2();
            }
          }
          ),
        ],
      ),
    );
  }

  Image buildImage(String picture) => Image.asset("assets/images/profile_page/$picture");
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double screenHeight = screen.size.height;
    final double screenWidth = screen.size.width;
    return SingleChildScrollView(
      child: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                width: screenWidth,
                child: Container(
                  height: 627,
                  width: 114,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45, bottom: 25),
                    child: SizedBox(height: 154,
                        child: imageInfo("user (1).png")),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: Container(
                          height: 175,
                          decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              personalInformantion("AD SOYAD      :"),
                              personalInformantion("YAŞ                 :"),
                              personalInformantion("CİNSİYET        :"),
                              personalInformantion("ACİL DURUM\nNUMARALARI :"),
                            ],
                          ),
                          Column(
                            children: [
                              personInfo2("AD SOYADI"),
                              personInfo2("YAŞ"),
                              personInfo2("CİNSİYET"),
                              Padding(
                                padding: const EdgeInsets.only(top: 27),
                                child: Text("ACİL DURUM NO"),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: SizedBox(
                          width: 160,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF4FCBE9),


                            ), onPressed: () {

                          }, child: Text("GÜNCELLE",
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                          ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 20),
                        child: SizedBox(
                          width: 160,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF4FCBE9),
                            ), onPressed: () {

                          }, child: Text("TAKİP SAYFASI",
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
                    if(constraints.maxWidth < 600){
                      return Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: ToyScreen(),
                      );
                    }else{
                      return Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: ToyScreen(),
                      );
                    }
                  }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding personInfo2(String yazi) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(yazi),
    );
  }
}

Image imageInfo(String yazi) => Image.asset("assets/images/profile_page/$yazi");







Padding personalInformantion(String name) {
  return Padding(
    padding: const EdgeInsets.only(right: 50, top: 10),
    child: Text(name, style: GoogleFonts.quicksand(
        textStyle: const TextStyle(color: tBlackColor, fontWeight: FontWeight.bold, fontSize: 15)), ),
  );
}






class ToyScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Center(
      child: SizedBox(
        width: 326.36, height: 136,
        child: Image.asset("assets/images/profile_page/Group 32.png"),
      ),
    );
  }
}


class Font{
  var font1 = GoogleFonts.quicksand(textStyle: const TextStyle(color: tBlackColor, fontWeight: FontWeight.bold, fontSize: 20));
  var font2 =  GoogleFonts.quicksand(textStyle: const TextStyle(color: tBlackColor, fontWeight: FontWeight.bold, fontSize: 35));
  var font3 = GoogleFonts.quicksand(textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15));
  var font4 =  GoogleFonts.quicksand(textStyle: const TextStyle(color: tBlackColor, fontWeight: FontWeight.bold, fontSize: 15));
}

class Picture1 extends StatelessWidget {

  var googleFont = Font();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 127),
          child: SizedBox(width: 300,height: 100,
            child:Image.asset("assets/images/profile_page/Açık Pembe Sevimli Çocuk Kitap Kapağı  2.png"),
          ),),

        Padding(
          padding: const EdgeInsets.only(left: 50, ),
          child: SizedBox(width: 200, height: 210,
              child:Image.asset("assets/images/profile_page/Asset 13.png")),
        ),
      ],
    );
  }
}

class Picture2 extends StatelessWidget {

  var googleFont = Font();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 125),
          child: SizedBox(width: 300,height: 100,
            child:Image.asset("assets/images/profile_page/Açık Pembe Sevimli Çocuk Kitap Kapağı  2.png"),
          ),),

        Padding(
          padding: const EdgeInsets.only(left: 60,top: 5),
          child: SizedBox(height: 200,
              child:Image.asset("assets/images/profile_page/Asset 13.png")),
        ),
      ],
    );
  }
}



