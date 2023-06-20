import 'package:flutter/material.dart';

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