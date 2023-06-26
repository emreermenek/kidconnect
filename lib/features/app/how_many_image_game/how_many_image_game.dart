import 'dart:math';

import 'package:bootcamp_f32/features/app/how_many_image_game/data/fruit_data.dart';
import 'package:bootcamp_f32/features/app/how_many_image_game/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HowManyImageGame extends ConsumerStatefulWidget {
  const HowManyImageGame({super.key});

  @override
  ConsumerState<HowManyImageGame> createState() => _HowManyImageGameState();
}

class _HowManyImageGameState extends ConsumerState<HowManyImageGame> {
  List<int> shapeCount = [1,2,3,4,5,6,7,8,9,];
  int shapes = 1;
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(dataServiceProvider3);
    final ValueNotifier<int> levels = ValueNotifier<int>(data.currentLevel);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 85),
            child: Center(
              child: Image(image: AssetImage('assets/images/choose_correct_images/background.png'),),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 85),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Image(image: AssetImage('assets/images/choose_correct_images/geri button.png'))),
                    Text('${data.currentLevel+1}/10', style: GoogleFonts.gluten(
                      textStyle:  const TextStyle(
                          color: Color(0xFF16519F),
                          fontSize: 36,
                          fontWeight: FontWeight.bold
                      ),
                    ),)
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: 292,
                height: 292,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.white,
                ),
                child: ValueListenableBuilder(
                  valueListenable: levels,
                  builder: (context, value, child) {
                    int image = Random().nextInt(6);
                    int shapes = Random().nextInt(9) + 1;
                    if(shapes == shapeCount[0]){
                      return Center(
                        child: Image(image: AssetImage(fruitImage[image]),width: 100,),
                      );
                    }else if(shapes == shapeCount[1]){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(image: AssetImage(fruitImage[image]),width: 100,),
                          Image(image: AssetImage(fruitImage[image]),width: 100,),
                        ],
                      );
                    }else if(shapes == shapeCount[2]){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                              Image(image: AssetImage(fruitImage[image]),width: 100,),
                              Image(image: AssetImage(fruitImage[image]),width: 100,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(image: AssetImage(fruitImage[image]),width: 100,),
                            ],
                          ),
                        ],
                      );
                    }else if(shapes == shapeCount[3]){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(image: AssetImage(fruitImage[image]),width: 100,),
                              Image(image: AssetImage(fruitImage[image]),width: 100,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(image: AssetImage(fruitImage[image]),width: 100,),
                              Image(image: AssetImage(fruitImage[image]),width: 100,),
                            ],
                          ),
                        ],
                      );
                    }else if(shapes == shapeCount[4]){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                            ],
                          ),
                        ],
                      );
                    }else if(shapes == shapeCount[5]){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                            ],
                          ),
                        ],
                      );
                    }else if(shapes == shapeCount[6]){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                            ],
                          ),
                        ],
                      );
                    }else if(shapes == shapeCount[7]){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                            ],
                          ),
                        ],
                      );
                    }else{
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                              Image(image: AssetImage(fruitImage[image]),width: 80,),
                            ],
                          ),
                        ],
                      );
                    }

                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
