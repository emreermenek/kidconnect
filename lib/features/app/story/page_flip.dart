import 'package:bootcamp_f32/features/app/story/pages/page_1.dart';
import 'package:bootcamp_f32/features/app/story/pages/page_10.dart';
import 'package:bootcamp_f32/features/app/story/pages/page_11.dart';
import 'package:bootcamp_f32/features/app/story/pages/page_12.dart';
import 'package:bootcamp_f32/features/app/story/pages/page_13.dart';
import 'package:bootcamp_f32/features/app/story/pages/page_14.dart';
import 'package:bootcamp_f32/features/app/story/pages/page_15.dart';
import 'package:bootcamp_f32/features/app/story/pages/page_16.dart';
import 'package:bootcamp_f32/features/app/story/pages/page_2.dart';
import 'package:bootcamp_f32/features/app/story/pages/page_3.dart';
import 'package:bootcamp_f32/features/app/story/pages/page_4.dart';
import 'package:bootcamp_f32/features/app/story/pages/page_5.dart';
import 'package:bootcamp_f32/features/app/story/pages/page_6.dart';
import 'package:bootcamp_f32/features/app/story/pages/page_7.dart';
import 'package:bootcamp_f32/features/app/story/pages/page_8.dart';
import 'package:bootcamp_f32/features/app/story/pages/page_9.dart';
import 'package:bootcamp_f32/features/app/story/start_page.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';

class PageFlip extends StatefulWidget {
  const PageFlip({super.key});

  @override
  State<PageFlip> createState() => _PageFlipState();
}

class _PageFlipState extends State<PageFlip> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: PageFlipWidget(
          duration: Duration(milliseconds: 500),
          children: [
            StoryPage1(),
            StoryPage2(),
            StoryPage3(),
            StoryPage4(),
            StoryPage5(),
            StoryPage6(),
            StoryPage7(),
            StoryPage8(),
            StoryPage9(),
            StoryPage10(),
            StoryPage11(),
            StoryPage12(),
            StoryPage13(),
            StoryPage14(),
            StoryPage15(),
            StoryPage16(),
          ],

        )
      ),
    );
  }
}
