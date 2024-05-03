import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/questionnaire/question1_no.dart';
import 'package:namer_app/questionnaire/question1_yes.dart';
import 'package:namer_app/symptoms/low_energy.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../main_screens/landing_page.dart';
import 'package:namer_app/controllers/symptom_controller.dart';
import 'package:namer_app/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:namer_app/components/text_card.dart';

class AppPalette {
  // Red
  Color brightRose = HexColor("#DA2942");
  Color orangeDew = HexColor("#FFBE71");
  Color purpleMint = HexColor("#B75CEE");
  Color black = HexColor("#000000");
  Color offWhite = HexColor("#FFFFF0");
  Color cherryBlossomLight = HexColor("#FFEFF1");
  Color white = HexColor("#FFFFFF");
  Color lightGrey = HexColor("#B9B9B9");
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

class Question7 extends StatefulWidget {
  Question7({super.key});
  @override
  _Question7State createState() => _Question7State();
}

class _Question7State extends State<Question7> {
  UserController userController = Get.put(UserController());
  SymptomController symptomController = Get.put(SymptomController());
  String _selected = "";
  @override
  void initState() {
    _selected = "";
    super.initState();
  }

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
            child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: 375,
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
                                        fontWeight: FontWeight.w400),
                                    children: [
                                      TextSpan(text: 'Skip now'),
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          child: Icon(Icons.arrow_forward,
                                              color: MyColors.purpleMint),
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          )),
                      Expanded(child: Container(

                      )),
                      Row(
                        //ROW 2
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('I also have',
                                style: TextStyle(
                                    color: appPalette.brightRose,
                                    fontSize: 20,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w500)),
                          ]),
                      SizedBox(
                          width: 350,
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Get.to(LowEnergy());
                                      },
                                      child:
                                      text_card({"text": "Diabetes"})),
                                  GestureDetector(
                                    onTap: () {},
                                    child: text_card({"text": "Thyroid issues"}),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: text_card({"text": "Low BP"}),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: text_card(
                                        {"text": "High BP"}),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: text_card(
                                        {"text": "Others"}),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Container(
                        height: 100,
                      ),
                      Container(
                          height: height * 0.12,
                          margin:
                          const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Card(
                                    color: MyColors.purpleMint,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Container(
                                      height: width * 0.12,
                                      width: width * 0.12,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        child: Icon(Icons.arrow_back_rounded,
                                            color: MyColors.white, size: 30),
                                      ),
                                    )),
                              ),
                              Stack(
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(landing_page());
                                        },
                                        child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(50.0),
                                            ),
                                            color: MyColors.purpleMint,
                                            child: Container(
                                              height: width * 0.15,
                                              width: width * 0.15,
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 2.0),
                                                child: Icon(
                                                    Icons.arrow_forward_rounded,
                                                    color: MyColors.white,
                                                    size: 40),
                                              ),
                                            )),
                                      )),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Image.asset(
                                          "assets/images/fools.png",
                                          fit: BoxFit.fill))
                                ],
                              ),
                            ],
                          )),
                    ]))));
  }
}
