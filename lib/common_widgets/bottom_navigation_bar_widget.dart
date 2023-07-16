import 'package:flutter/material.dart';

import '../features/app/main_pages/home_page/home_page.dart';
import '../features/app/main_pages/profile_page/profile_page.dart';
import '../features/app/main_pages/settings_page/settings_page.dart';

SizedBox botNavBar({required int currentIndex, required BuildContext context}) {
  return SizedBox(
    height: 80,
    child: BottomNavigationBar(
      selectedItemColor: Colors.black,
      currentIndex: currentIndex,
      selectedFontSize: 14,
      unselectedFontSize: 12,
      showSelectedLabels: true,
      backgroundColor: Colors.white,
      onTap: (value) {

          switch (value) {
            case 0:
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
            case 1:
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ));
            case 2:
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ));
          }
        currentIndex = value;
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
  );
}
