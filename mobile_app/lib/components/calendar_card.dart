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

class calender_card extends StatelessWidget {
  calender_card(this.data);
  final data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(data["day"],
            style: TextStyle(
                color: appPalette.purpleMint,
                fontSize: 14,
                decoration: TextDecoration.none
            )),
        Container(
            child: Card(
              color: appPalette.orangeDew,
              child: SizedBox(
                  height: 60,
                  width: 60,
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                          data["date"],
                          style: TextStyle(
                              color: appPalette.black,
                              fontSize: 24,
                              decoration: TextDecoration.none)
                      )
                  )
              ),
            )
        )
      ],
    );
  }
}