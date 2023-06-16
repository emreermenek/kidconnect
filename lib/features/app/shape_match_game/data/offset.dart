import 'package:flutter/material.dart';

const List<Offset> leftDots =
[Offset(105, 130), Offset(105, 316), Offset(105, 503)];
const List<Offset> rightDots =
[Offset(193,129),Offset(190,315),Offset(190,502)];
const List<Offset> circles =
[Offset(45, 93),Offset(45, 279),Offset(45, 465)];

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