import 'package:bootcamp_f32/constants/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final List cards = ['assets/images/home_page_image/content/card1.png','assets/images/home_page_image/content/card8.png',
  'assets/images/home_page_image/content/card3.png', 'assets/images/home_page_image/content/card6.png',
  'assets/images/home_page_image/content/card4.png','assets/images/home_page_image/content/card2.png',
  'assets/images/home_page_image/content/card5.png','assets/images/home_page_image/content/card7.png'];

final List texts = ['ALFABE','ÇİZİM','SAYILAR','RENKLER','ŞEKİLLER','OKUMA','SESLENDİRME','ŞARKILAR'];

class _HomePageState extends State<HomePage> {
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
              width: 280,
              child: ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    color: tPrimaryColor,
                    child: const Center(child: Text('Hoşgeldin',style: TextStyle(fontWeight: FontWeight.bold),)),
                  )
              ),
            ),
            const Image(image: AssetImage('assets/images/home_page_image/cute-tiger.png'),width: 100, ),
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
                icon: Image(image: AssetImage('assets/images/home_page_image/bottom_navigation_bar_images/home-big.png'),)
            ),
            BottomNavigationBarItem(
              label: 'PROFİL',
                icon: Image(image: AssetImage('assets/images/home_page_image/bottom_navigation_bar_images/student-card -big.png'),)
            ),
            BottomNavigationBarItem(
              label: 'AYARLAR',

                icon: Image(image: AssetImage('assets/images/home_page_image/bottom_navigation_bar_images/settings-big.png'),)
            ),

          ],
        ),
      ),

      body: Stack(
        children: [
          const Positioned(
            left: 0,
              top: 0,
              child: Image(image: AssetImage('assets/images/home_page_image/content/shape7.png'),)
          ),
          const Positioned(
              right: 0,
              top: 0,
              child: Image(image: AssetImage('assets/images/home_page_image/content/shape6.png'),)
          ),
          const Positioned(
              left: 0,
              bottom: 0,
              child: Image(image: AssetImage('assets/images/home_page_image/content/shape5.png'),)
          ),
          const Positioned(
              right: 0,
              bottom: 0,
              child: Image(image: AssetImage('assets/images/home_page_image/content/shape4.png'),)
          ),
          const Positioned(
              right: 0,
              top: 190,
              child: Image(image: AssetImage('assets/images/home_page_image/content/shape2.png'),)
          ),
          const Positioned(
              right: 0,
              top: 360,
              child: Image(image: AssetImage('assets/images/home_page_image/content/shape3.png'),)
          ),
          const Positioned(
              left: 0,
              top: 220,
              child: Image(image: AssetImage('assets/images/home_page_image/content/shape1.png'),)
          ),

          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
            scrollDirection: Axis.vertical,
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:
              240, //if you have a device with 300px width only one category is shown in a row if you have 500px then two categories are lied side by side in a row
              childAspectRatio:
              3 / 2, // for 200px width, I need 300px height (for extra spacing)
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
              itemBuilder: (context, index) {

                return Container(

                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.grey.shade500,
                        offset: const Offset(
                          0,
                          6
                        )
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32)
                  ),
                  child: Column(
                    children: [
                        Image(image: AssetImage(cards[index]),),
                        const SizedBox(height: 2,),
                        Text(texts[index], style: const TextStyle(fontSize: 16),textScaleFactor: 1.0,),
                    ],
                  ),
                );
              },
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path>{
    @override
  Path getClip(Size size){

      Path path0 = Path();
      path0.moveTo(size.width*0.0008333,size.height*0.5000000);
      path0.quadraticBezierTo(size.width*0.0008000,size.height*0.0946000,size.width*0.0826417,0);
      path0.lineTo(size.width*0.4562333,0);
      path0.lineTo(size.width*0.8384333,0);
      path0.quadraticBezierTo(size.width*0.9157000,size.height*0.0962333,size.width*0.9162417,size.height*0.5061000);
      path0.cubicTo(size.width*0.9129667,size.height*0.7439667,size.width*0.9507833,size.height*0.7810333,size.width*0.9975000,size.height*0.8466667);
      path0.quadraticBezierTo(size.width*0.9844750,size.height*0.9988000,size.width*0.8705333,size.height);
      path0.lineTo(size.width*0.0830417,size.height);
      path0.quadraticBezierTo(size.width*-0.0013583,size.height*0.8973000,size.width*0.0008333,size.height*0.5000000);
      path0.close();


      return path0;

    }

    @override
    bool shouldReclip(CustomClipper<Path> oldClipper){
      return false;
    }

}
