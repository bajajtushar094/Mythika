import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
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

class screen4 extends StatelessWidget {
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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 375,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/getstarted.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(//ROW 2
                      children: [
                        Container(
                            width: 375,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Let’s start this journey together", style: TextStyle(color: appPalette.brightRose, fontSize: 24, decoration: TextDecoration.none, fontWeight: FontWeight.w900)),
                            )
                        )
                      ]),
                  Row(//ROW 2
                      children: [
                        Container(
                            width: 380,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("and make Mythika your safe space️", style: TextStyle(color: appPalette.brightRose, fontSize: 18, decoration: TextDecoration.none, fontWeight: FontWeight.w600)),
                            )
                        )
                      ]),
                  Row(// ROW 3
                      children: [
                        Container(
                          width:175,
                          margin: EdgeInsets.only(top:45.0, left: 50.0),
                          child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(appPalette.orangeDew),
                                foregroundColor: MaterialStateProperty.all<Color>(appPalette.brightRose),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => phone_number()));
                              },
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(color: appPalette.brightRose, fontSize: 18, decoration: TextDecoration.none, fontWeight: FontWeight.w600),
                                  children: [
                                    TextSpan(text: 'Get Started'),
                                    WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
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
                ])));
  }
}