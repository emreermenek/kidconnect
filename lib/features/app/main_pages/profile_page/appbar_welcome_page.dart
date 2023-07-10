
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarUser extends StatelessWidget implements PreferredSizeWidget{
  const AppBarUser({
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(70.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 75,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.asset("assets/images/profile_page/windmill 1.png", ),
          ),
          SizedBox(width: 30,),
          Text('PROFİL',style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
          SizedBox(width: 30,),
          const Image(image: AssetImage("assets/images/profile_page/balloons (1).png"),width: 58, height: 62,),
        ],
      ),
    );
  }
}
