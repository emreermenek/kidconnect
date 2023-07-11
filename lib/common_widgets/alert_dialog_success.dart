import 'dart:ui';

import 'package:bootcamp_f32/features/app/shape_match_game/shape_match_game/shape_match_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/app/shape_match_game/services/data_change_notifier.dart';

class AlertDialogSuccess extends StatelessWidget {
  const AlertDialogSuccess({
    super.key,
    required this.dataRepo,
  });

  final DataChangeNotifier dataRepo;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 10,sigmaX: 10),
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
        ),
        backgroundColor: const Color(0xFFFFEACE),
        content: SizedBox(
          height: 400,
          child: Stack(
            children:
            [
              Positioned(
                  top: 0,
                  left: 45,
                  child: Image.asset('assets/images/alert_dialog/success/image 91.png',width: 200,)
              ),
              Positioned(
                  top: 180,

                  child: Image.asset('assets/images/alert_dialog/success/harika gidiyorsun.png',width: 300,)
              ),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.asset('assets/images/alert_dialog/success/Group 52.png',width: 150,)
              ),
              Positioned(
                left: 10,
                bottom: 110,
                child: InkWell(
                  onTap: () {
                    dataRepo.resetGame();
                    isFirstTrue = false;
                    isSecondTrue = false;
                    isThirdTrue = false;
                    dataRepo.levelUp();
                  },
                  child: Image.asset('assets/images/alert_dialog/success/Group 50.png',width: 160,),
                ),
              ),
              Positioned(
                left: 30,
                bottom: 70,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    dataRepo.resetGame();
                    isFirstTrue = false;
                    isSecondTrue = false;
                    isThirdTrue = false;
                  },
                  child: Image.asset('assets/images/alert_dialog/success/Group 51.png',width: 150,),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}