import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/globals/fonts.dart';
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

class otp extends StatefulWidget{
  otp({super.key});

  @override
  _otpState createState() => _otpState();
}


class _otpState extends State<otp> {
  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.floor();
    int height = MediaQuery.of(context).size.height.floor();
    return Scaffold(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: width*0.15),
                        width: width*0.7,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                color: appPalette.brightRose).merge(FontStyles.text26Bold),
                            children: [
                              TextSpan(text: 'Entry your OTP'),
                            ],
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.only(left: width*0.15),
                        width: width*0.7,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                color: appPalette.brightRose).merge(FontStyles.text18),
                            children: [
                              TextSpan(
                                  text: 'You would have received an OTP. Let’s verify it’s you 🚀'),
                            ],
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 55,
                            width: 55,
                            margin: EdgeInsets.only(
                                top: 50.0, left: width*0.01),
                            child: Card(
                              color: MyColors.cherryBlossomLight,
                              elevation: 5,
                              child: TextField(
                                maxLength: 1,
                                textInputAction: TextInputAction.next,
                                onSubmitted: (value) {
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => landing_page()));
                                },
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: MyColors.black).merge(FontStyles.text22),
                                decoration: InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left:15.0),
                                  hintText: '',
                                ),
                              ),
                            )),
                        Container(
                            height: 55,
                            width: 55,
                            margin: EdgeInsets.only(
                                top: 50.0, left: width*0.07),
                            child: Card(
                              color: MyColors.cherryBlossomLight,
                              elevation: 5,
                              child: TextField(
                                maxLength: 1,
                                textInputAction: TextInputAction.next,
                                style: TextStyle(color: MyColors.black).merge(FontStyles.text22),
                                onSubmitted: (value) {
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => landing_page()));
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left:15.0),
                                  hintText: '',
                                ),
                              ),
                            )),
                        Container(
                            height: 55,
                            width: 55,
                            margin: EdgeInsets.only(
                                top: 50.0, left: width*0.07),
                            child: Card(
                              color: MyColors.cherryBlossomLight,
                              elevation: 5,
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                maxLength: 1,
                                style: TextStyle(color: MyColors.black).merge(FontStyles.text22),
                                onSubmitted: (value) {
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => landing_page()));
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left:15.0),
                                  hintText: '',
                                ),
                              ),
                            )),
                        Container(
                            height: 55,
                            width: 55,
                            margin: EdgeInsets.only(
                                top: 50.0, left: width*0.07),
                            child: Card(
                              color: MyColors.cherryBlossomLight,
                              elevation: 5,
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                maxLength: 1,
                                style: TextStyle(color: MyColors.black).merge(FontStyles.text22),
                                onSubmitted: (value) {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => name()));
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left:15.0),
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
