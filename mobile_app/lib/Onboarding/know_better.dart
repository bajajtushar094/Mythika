import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/questionnaire/question1.dart';
import 'package:namer_app/symptoms/low_energy.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import './phone_number.dart';
import '../main_screens/landing_page.dart';

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

class KnowBetter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg-landing.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 375,
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      color: MyColors.purpleMint,
                                      fontSize: 18,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w600),
                                  children: [
                                    TextSpan(text: 'Let\'s do it!'),
                                    WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        child: Icon(Icons.arrow_forward),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        )),
                    Container(
                      width: 375,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/safe_space.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      //ROW 2
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            child: Text("Help us know better",
                                style: TextStyle(
                                    color: appPalette.brightRose,
                                    fontSize: 24,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w900)),
                          )
                        ]),
                    Row(
                      //ROW 2
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            child: Text(
                                "by answering some questions about you ✏️",
                                style: TextStyle(
                                    color: appPalette.brightRose,
                                    fontSize: 18,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w600)),
                          )
                        ]),
                    Row(// ROW 3
                        children: [
                          Container(
                            width: 175,
                            margin: EdgeInsets.only(top: 45.0, left: 50.0),
                            child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      MyColors.brightRose),
                                  foregroundColor: MaterialStateProperty.all<Color>(
                                      MyColors.white),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Question1()));
                                },
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: MyColors.white,
                                        fontSize: 18,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.w600),
                                    children: [
                                      TextSpan(text: 'Let\'s do it!'),
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          child: Icon(Icons.arrow_forward),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              //Text('TextButton' , style: TextStyle(color: appPalette.brightRose, fontSize: 18, decoration: TextDecoration.none)),
                            ),
                          ),
                        ]),
                  ])
            )
            ));
  }
}
