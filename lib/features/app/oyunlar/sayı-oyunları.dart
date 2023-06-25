import 'package:bootcamp_f32/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:bootcamp_f32/features/app/first-page.dart';

class SayiOyunlariPage extends StatefulWidget {
  const SayiOyunlariPage({Key? key}) : super(key: key);

  @override
  State<SayiOyunlariPage> createState() => _SayiOyunlariPageState();
}

final List cards = [
  'assets/images/oyunlar-images/sayı-oyunları/magnifier.png',
  'assets/images/oyunlar-images/sayı-oyunları/Group-2.png',
  'assets/images/oyunlar-images/sayı-oyunları/Group.png',
  'assets/images/oyunlar-images/sayı-oyunları/true-or-false.png',
  'assets/images/oyunlar-images/sayı-oyunları/alarm.png',
  'assets/images/oyunlar-images/sayı-oyunları/person.png',
  'assets/images/oyunlar-images/sayı-oyunları/ear.png',
  'assets/images/oyunlar-images/sayı-oyunları/scrabble.png',
];

final List texts = [
  'KAYIP SAYI',
  'KAÇ TANE VAR',
  'BÜYÜK MÜ? KÜÇÜK MÜ?',
  'DOĞRUYU BULALIM',
  'SAATLER',
  'GÖLGE BULMA',
  'DİNLE EŞLEŞTİR',
  'TORBA OYUNU',
];

final List<String> routes = [];

class _SayiOyunlariPageState extends State<SayiOyunlariPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhiteColor,
      appBar: AppBar(
        toolbarHeight: 75,
        elevation: 0,
        title: Row(
          children: [
            SizedBox(
              width: 250,
              child: ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    color: tPrimaryColor,
                    child: const Center(
                        child: Text(
                      'SAYI OYUNLARI',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  )),
            ),
            const Image(
              image: AssetImage('assets/images/home_page_image/cute-tiger.png'),
              width: 70,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 85,
        child: BottomNavigationBar(
          selectedItemColor: Colors.black,
          currentIndex: _currentIndex,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          showSelectedLabels: true,
          backgroundColor: Colors.white,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                label: 'ANA SAYFA',
                icon: Image(
                  image: AssetImage(
                      'assets/images/home_page_image/bottom_navigation_bar_images/home-big.png'),
                )),
            BottomNavigationBarItem(
                label: 'PROFİL',
                icon: Image(
                  image: AssetImage(
                      'assets/images/home_page_image/bottom_navigation_bar_images/student-card -big.png'),
                )),
            BottomNavigationBarItem(
                label: 'AYARLAR',
                icon: Image(
                  image: AssetImage(
                      'assets/images/home_page_image/bottom_navigation_bar_images/settings-big.png'),
                )),
          ],
        ),
      ),
      body: Stack(
        children: [
          const Positioned(
              left: 0,
              top: 0,
              child: Image(
                image: AssetImage(
                    'assets/images/home_page_image/content/shape7.png'),
              )),
          const Positioned(
              right: 0,
              top: 0,
              child: Image(
                image: AssetImage(
                    'assets/images/home_page_image/content/shape6.png'),
              )),
          const Positioned(
              left: 0,
              bottom: 0,
              child: Image(
                image: AssetImage(
                    'assets/images/home_page_image/content/shape5.png'),
              )),
          const Positioned(
              right: 0,
              bottom: 0,
              child: Image(
                image: AssetImage(
                    'assets/images/home_page_image/content/shape4.png'),
              )),
          const Positioned(
              right: 0,
              top: 170,
              child: Image(
                image: AssetImage(
                    'assets/images/home_page_image/content/shape2.png'),
              )),
          const Positioned(
              right: 0,
              top: 300,
              child: Image(
                image: AssetImage(
                    'assets/images/home_page_image/content/shape3.png'),
              )),
          const Positioned(
              left: 0,
              top: 150,
              child: Image(
                image: AssetImage(
                    'assets/images/home_page_image/content/shape1.png'),
              )),
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            scrollDirection: Axis.vertical,
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:
                  250, //if you have a device with 300px width only one category is shown in a row if you have 500px then two categories are lied side by side in a row
              childAspectRatio: 4 /
                  3, // for 200px width, I need 300px height (for extra spacing)
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, routes[index]);
                },
                child: GridTile(
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              color: Colors.grey.shade500,
                              offset: const Offset(0, 6)),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Image(
                          image: AssetImage(cards[index]),
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          texts[index],
                          style: const TextStyle(fontSize: 16),
                          textScaleFactor: 1.0,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0008333, size.height * 0.5000000);
    path0.quadraticBezierTo(size.width * 0.0008000, size.height * 0.0946000,
        size.width * 0.0826417, 0);
    path0.lineTo(size.width * 0.4562333, 0);
    path0.lineTo(size.width * 0.8384333, 0);
    path0.quadraticBezierTo(size.width * 0.9157000, size.height * 0.0962333,
        size.width * 0.9162417, size.height * 0.5061000);
    path0.cubicTo(
        size.width * 0.9129667,
        size.height * 0.7439667,
        size.width * 0.9507833,
        size.height * 0.7810333,
        size.width * 0.9975000,
        size.height * 0.8466667);
    path0.quadraticBezierTo(size.width * 0.9844750, size.height * 0.9988000,
        size.width * 0.8705333, size.height);
    path0.lineTo(size.width * 0.0830417, size.height);
    path0.quadraticBezierTo(size.width * -0.0013583, size.height * 0.8973000,
        size.width * 0.0008333, size.height * 0.5000000);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
