import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class AppPalette {
  // Red
  Color brightRose = HexColor("#DA2942");
  Color orangeDew = HexColor("#FFBE71");
  Color purpleMint = HexColor("#B75CEE");
  Color black = HexColor("#000000");
  Color offWhite = HexColor("#FFFFF0");
  Color cherryBlossomLight = HexColor("#FFEFF1");
  static const imperialRed = Color(0xFFE54B4B);

  // White
  static const seashell = Color(0xFFF7EBE8);

  // Grey
  static const grey = _GreyColors();
}

class _GreyColors {
  const _GreyColors();

  final grey50 = const Color(0xFFFAFAFA);
  final grey100 = const Color(0xFFF5F5F5);
}

AppPalette appPalette = AppPalette();

class emoji_card extends StatelessWidget {
  emoji_card(this.data);
  final data;
  @override
  Widget build(BuildContext context) {
    return Container(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20),
        // ),
        alignment: Alignment.center,
        child : Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  //set border radius more than 50% of height and width to make circle
                ),
                color: appPalette.cherryBlossomLight,
                child: SizedBox(
                    height: 80,
                    width: 60,
                    child: Center(
                        child: Text('😭',
                            style:TextStyle(
                                fontSize: 28
                            ))
                    )

                )
            )

        )
    );
  }
}