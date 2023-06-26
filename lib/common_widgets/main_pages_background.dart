import 'package:flutter/material.dart';

class MainPagesBackground extends StatelessWidget {
  const MainPagesBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
            left: 0,
            top: 0,
            child: Image(
              image: AssetImage(
                  'assets/images/home_page_image/content/shape7.png'),
            )),
        Positioned(
            right: 0,
            top: 0,
            child: Image(
              image: AssetImage(
                  'assets/images/home_page_image/content/shape6.png'),
            )),
        Positioned(
            left: 0,
            bottom: 0,
            child: Image(
              image: AssetImage(
                  'assets/images/home_page_image/content/shape5.png'),
            )),
        Positioned(
            right: 0,
            bottom: 0,
            child: Image(
              image: AssetImage(
                  'assets/images/home_page_image/content/shape4.png'),
            )),
        Positioned(
            right: 0,
            top: 170,
            child: Image(
              image: AssetImage(
                  'assets/images/home_page_image/content/shape2.png'),
            )),
        Positioned(
            right: 0,
            top: 300,
            child: Image(
              image: AssetImage(
                  'assets/images/home_page_image/content/shape3.png'),
            )),
        Positioned(
            left: 0,
            top: 150,
            child: Image(
              image: AssetImage(
                  'assets/images/home_page_image/content/shape1.png'),
            )),
      ],
    );
  }
}