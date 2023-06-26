import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key, required this.context, required this.texts, required this.cards, required this.routes,
  });

  final BuildContext context;
  final List texts;
  final List cards;
  final List routes;

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      scrollDirection: Axis.vertical,
      itemCount: texts.length,
      gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 1,
        crossAxisSpacing: 30,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        final ValueNotifier<int> textLength = ValueNotifier<int>(texts[index].length);
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => routes[index],));
          },
          child: GridTile(
            child: Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        color: Colors.grey.shade500,
                        offset: const Offset(0, 6)),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Image(
                    image: AssetImage(cards[index]),
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ValueListenableBuilder(
                    valueListenable: textLength,
                    builder: (BuildContext context, value, Widget? child) {
                      if(texts[index].length > 14){
                        return Text(
                            texts[index],
                            style: GoogleFonts.comfortaa(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                )
                            )
                        );
                      }else{
                        return Text(
                            texts[index],
                            style: GoogleFonts.comfortaa(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                )
                            )
                        );
                      }

                    },

                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}