import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import './screen2.dart';

class AppPalette {
  // Red
  Color brightRose = HexColor("#DA2942");
  Color orangeDew = HexColor("#FFBE71");
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

class phone_number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg-landing.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: appPalette.brightRose,fontSize: 26, decoration: TextDecoration.none, fontWeight: FontWeight.w900),
                            children: [
                              TextSpan(text: 'Ready, set, go!'),
                            ],
                          ),
                        )
                    ),
                    Container(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: appPalette.brightRose, fontSize: 18, decoration: TextDecoration.none, fontWeight: FontWeight.w600),
                            children: [
                              TextSpan(text: 'Let us log into this safe place of yours'),
                            ],
                          ),
                        )
                    ),
                  ],
                )
            )
        )
    );
  }
}