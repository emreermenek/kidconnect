import 'package:bootcamp_f32/features/app/shape_match_game/data/difficulty.dart';
import 'package:bootcamp_f32/features/app/shape_match_game/services/data_change_notifier.dart';
import 'package:flutter/material.dart';

class DifficultyWidget extends StatelessWidget {
  const DifficultyWidget({
    super.key,
    required this.dataRepo,
  });

  final DataChangeNotifier dataRepo;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: difficulty(dataRepo.currentLevel),
      builder: (context, snapshot)
      {
        if(snapshot.data == 'kolay'){
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 260,),
              Image(image: AssetImage('assets/images/image_match/background/kolay.png'),),
            ],
          );
        }else if(snapshot.data == 'orta'){
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 260,),
              Image(image: AssetImage('assets/images/image_match/background/orta.png'),)
            ],
          );

        }else{
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 260,),
              Image(image: AssetImage('assets/images/image_match/background/zor.png'),)
            ],
          );

        }
      },
    );
  }
}