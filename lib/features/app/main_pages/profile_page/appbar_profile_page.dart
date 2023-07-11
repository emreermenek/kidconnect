import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarClient extends StatelessWidget implements PreferredSizeWidget{
  const AppBarClient({
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
          SizedBox( width: 100,height: 200,
              child: Image.asset("assets/images/profile_page/Asset10.png")),
          const SizedBox(width: 20,),
          Text('PROFİL',style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
          const SizedBox(width: 20,),
          const Image(image: AssetImage('assets/images/profile_page/balloons (1).png'),width: 40, height: 62,),
        ],
      ),
    );
  }
}