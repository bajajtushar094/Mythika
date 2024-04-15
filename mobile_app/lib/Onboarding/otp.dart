import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/main_screens/landing_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import './screen2.dart';
import './name.dart';
import 'package:namer_app/globals/colors.dart';

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

class otp extends StatelessWidget {
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
                            style: TextStyle(
                                color: appPalette.brightRose,
                                fontSize: 26,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w900),
                            children: [
                              TextSpan(text: 'Entry your OTP'),
                            ],
                          ),
                        )),
                    Container(
                      margin: const EdgeInsets.only(left:50, right: 50),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                color: appPalette.brightRose,
                                fontSize: 18,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w600),
                            children: [
                              TextSpan(
                                  text: 'You would have received an OTP. Let’s verify it’s you 🚀'),
                            ],
                          ),
                        )),
                    Row(
                      children: [
                        Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(
                                top: 50.0, left: 60),
                            child: Card(
                              color: MyColors.cherryBlossomLight,
                              elevation: 5,
                              child: TextField(
                                onSubmitted: (value) {
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => landing_page()));
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 20.0, color: MyColors.grey300, fontWeight: FontWeight.w400),
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintText: '',
                                ),
                              ),
                            )),
                        Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(
                                top: 50.0, left: 20),
                            child: Card(
                              color: MyColors.cherryBlossomLight,
                              elevation: 5,
                              child: TextField(
                                onSubmitted: (value) {
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => landing_page()));
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 20.0, color: MyColors.grey300, fontWeight: FontWeight.w400),
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintText: '',
                                ),
                              ),
                            )),
                        Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(
                                top: 50.0, left: 20),
                            child: Card(
                              color: MyColors.cherryBlossomLight,
                              elevation: 5,
                              child: TextField(
                                onSubmitted: (value) {
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => landing_page()));
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 20.0, color: MyColors.grey300, fontWeight: FontWeight.w400),
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintText: '',
                                ),
                              ),
                            )),
                        Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(
                                top: 50.0, left: 20, right: 50),
                            child: Card(
                              color: MyColors.cherryBlossomLight,
                              elevation: 5,
                              child: TextField(
                                onSubmitted: (value) {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => name()));
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 20.0, color: MyColors.grey300, fontWeight: FontWeight.w400),
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintText: '',
                                ),
                              ),
                            ))
                      ],
                    )

                  ],
                ))));
  }
}
