import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWidget({
    super.key, required this.title
  });
  @override
  Size get preferredSize => const Size.fromHeight(75.0);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 75,
      elevation: 0,
      leading: InkWell(
        onTap: ()
        {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.arrow_back, color: Colors.black,),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              title,
              style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  )
              )
          ),
          const SizedBox(width: 10,),
          const Image(
            image: AssetImage('assets/images/home_page_image/cute-tiger.png'),
            width: 75,
          ),
        ],
      ),
    );
  }
}