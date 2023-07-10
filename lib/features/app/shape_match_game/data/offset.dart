import 'package:flutter/material.dart';

const List<Offset> leftDots =
[Offset(90, 55), Offset(90, 210), Offset(90, 370)];
const List<Offset> rightDots =
[Offset(185,55),Offset(185,210),Offset(185,370)];
const List<Offset> circles =
[Offset(50, 50),Offset(50, 210),Offset(50, 370)];

List<List<int>> levelInfo =
[
  [0,1,1,2,2,0],   //level1
  [0,2,1,0,2,1],   //level2
  [0,1,1,2,2,0],   //level3
  [0,0,1,2,2,1],   //level4
  [0,1,1,2,2,0],   //level5
  [0,1,1,2,2,0],   //level6
  [0,2,1,0,2,1],   //level7
  [0,0,1,2,2,1],   //level8
  [0,1,1,2,2,0],   //level9
  [0,2,1,1,2,0]    //level10

];
