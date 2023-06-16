import 'dart:ui';

import 'package:flutter/material.dart';

import '../features/app/shape_match_game/services/data_change_notifier.dart';
import '../features/app/shape_match_game/shape_match_game/shape_match_game.dart';

class AlertDialogSuccess extends StatelessWidget {
  const AlertDialogSuccess({
    super.key,
    required this.dataRepo,
  });

  final DataChangeNotifier dataRepo;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
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
                  left: 0,
                  top: 0,
                  child: Image.asset('assets/images/alert_dialog/fail/üst kutucuklar.png',width: 150,)
              ),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.asset('assets/images/alert_dialog/fail/alt kutular.png',width: 150,)
              ),
              Positioned(
                  top: 40,
                  right: 10,
                  child: Image.asset('assets/images/alert_dialog/fail/Group 44.png',width:250,)
              ),
              Positioned(
                left: 10,
                bottom: 80,
                child: InkWell(
                  onTap: () {
                    dataRepo.resetGame();
                    isFirstTrue = false;
                    isSecondTrue = false;
                    isThirdTrue = false;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MatchImage()),
                    );
                  },
                  child: Image.asset('assets/images/alert_dialog/fail/Group 46.png',width: 160,),
                ),
              ),
              Positioned(
                left: 30,
                bottom: 40,
                child: InkWell(
                  onTap: () {
                    dataRepo.resetGame();
                    isFirstTrue = false;
                    isSecondTrue = false;
                    isThirdTrue = false;
                  },
                  child: Image.asset('assets/images/alert_dialog/fail/Group 47.png',width: 150,),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}