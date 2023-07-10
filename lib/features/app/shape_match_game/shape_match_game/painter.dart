import 'package:bootcamp_f32/constants/colors.dart';
import 'package:bootcamp_f32/features/app/shape_match_game/shape_match_game/shape_match_game.dart';
import 'package:flutter/material.dart';

import '../data/offset.dart';

class LinePainter extends CustomPainter{

  final Offset? firstStartPoint;
  final Offset? firstEndPoint;
  final Offset? secondStartPoint;
  final Offset? secondEndPoint;
  final Offset? thirdStartPoint;
  final Offset? thirdEndPoint;
  final int currentLevel;
  bool isFirstClicked;
  bool isSecondClicked;
  bool isThirdClicked;


  LinePainter({
    required this.isFirstClicked,
    required this.isSecondClicked,
    required this.isThirdClicked,
    required this.currentLevel,
    this.firstStartPoint,
    this.firstEndPoint,
    this.secondStartPoint,
    this.secondEndPoint,
    this.thirdStartPoint,
    this.thirdEndPoint,
  });

  @override
  void paint(Canvas canvas, Size size) {

    //first
    if(firstStartPoint == leftDots[levelInfo[currentLevel][0]] && firstEndPoint == rightDots[levelInfo[currentLevel][1]])
    {
      final firstPaint = Paint()
        ..color = Colors.green
        ..strokeWidth = 3;
      if(firstStartPoint!=null && firstEndPoint !=null)
      {
        canvas.drawLine(firstStartPoint!, firstEndPoint!, firstPaint);
      }
      isFirstTrue = true;
    }else
    {
      final firstPaint = Paint()
        ..color = tErrorColor
        ..strokeWidth = 3;
      if(firstStartPoint!=null && firstEndPoint !=null)
      {
        canvas.drawLine(firstStartPoint!, firstEndPoint!, firstPaint);
      }
    }

    //second
    if(secondStartPoint == leftDots[levelInfo[currentLevel][2]] && secondEndPoint == rightDots[levelInfo[currentLevel][3]])
    {
      final secondPaint = Paint()
        ..color = Colors.green
        ..strokeWidth = 3;
      if(secondStartPoint!=null && secondEndPoint !=null)
      {
        canvas.drawLine(secondStartPoint!, secondEndPoint!, secondPaint);
      }
      isSecondTrue = true;
    }else
    {
      final secondPaint = Paint()
        ..color = tErrorColor
        ..strokeWidth = 3;
      if(secondStartPoint!=null && secondEndPoint !=null)
      {
        canvas.drawLine(secondStartPoint!, secondEndPoint!, secondPaint);
      }
    }

    //third
    if(thirdStartPoint == leftDots[levelInfo[currentLevel][4]] && thirdEndPoint == rightDots[levelInfo[currentLevel][5]])
    {

      final thirdPaint = Paint()
        ..color = Colors.green
        ..strokeWidth = 3;
      if(thirdStartPoint!=null && thirdEndPoint !=null)
      {
        canvas.drawLine(thirdStartPoint!, thirdEndPoint!, thirdPaint);
      }
      isThirdTrue = true;
    }else
    {
      final thirdPaint = Paint()
        ..color = tErrorColor
        ..strokeWidth = 3;
      if(thirdStartPoint!=null && thirdEndPoint !=null)
      {
        canvas.drawLine(thirdStartPoint!, thirdEndPoint!, thirdPaint);
      }
    }
    //foreground
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    if(isFirstClicked == true){
      canvas.drawCircle(circles[0], 47, paint);

    } else if(isSecondClicked == true){
      canvas.drawCircle(circles[1], 47, paint);


    } else if(isThirdClicked == true){
      canvas.drawCircle(circles[2], 47, paint);

    }


  }
  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return true;
  }
}