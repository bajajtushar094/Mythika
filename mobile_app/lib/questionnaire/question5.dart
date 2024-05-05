import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/controllers/questionnaire_controller.dart';
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
import 'package:namer_app/questionnaire/question6.dart';

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

class Question5 extends StatefulWidget {
  Question5({super.key});
  @override
  _Question5State createState() => _Question5State();
}

class _Question5State extends State<Question5> {
  UserController userController = Get.put(UserController());
  SymptomController symptomController = Get.put(SymptomController());
  QuestionnaireController questionnaireController = Get.put(QuestionnaireController());
  String _selected = "";
  Set<String> _subanswers = {};
  @override
  void initState() {
    _selected = "";
    _subanswers = {};
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
                      Expanded(child: Container()),
                      Row(
                          //ROW 2
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 300,
                              child: Text(
                                  'I‘ve undergone a medical/surgical procedure related to my reproductive health',
                                  style: TextStyle(
                                      color: appPalette.brightRose,
                                      fontSize: 20,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ]),
                      Row(
                          // ROW 3
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: width * 0.9,
                                child: GestureDetector(
                                    onTap: () {
                                      // Get.to(Question1No());
                                      String value = "";
                                      if (_selected != "no") {
                                        value = "no";
                                      }
                                      setState(() => _selected = value);
                                    },
                                    child: Card(
                                        color: _selected == "no"
                                            ? MyColors.orangeDew
                                            : MyColors.offWhite,
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'No',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: MyColors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )))),
                          ]),
                      Row(
                          // ROW 3
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: width * 0.9,
                                child: GestureDetector(
                                    onTap: () {
                                      // Get.to(Question1Yes());
                                      String value = "";
                                      if (_selected != "doctor") {
                                        value = "doctor";
                                      }
                                      setState(() {
                                        _selected = value;
                                        _subanswers = {};
                                      });
                                    },
                                    child: Card(
                                        color: _selected == "doctor"
                                            ? MyColors.orangeDew
                                            : MyColors.offWhite,
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Doctor has suggested something',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: MyColors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )))),
                          ]),
                      if (_selected == "doctor")
                        SizedBox(
                            width: width * 0.95,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if(_subanswers.contains("Remove uterus")){
                                              _subanswers.remove("Remove uterus");
                                            }
                                            else{
                                              _subanswers.add("Remove uterus");
                                            }
                                          });
                                        },
                                        child: text_card({
                                          "text": "Remove uterus",
                                          "selected": _subanswers
                                              .contains("Remove uterus")
                                        })),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if(_subanswers.contains("Remove Ovary")){
                                            _subanswers.remove("Remove Ovary");
                                          }
                                          else{
                                            _subanswers.add("Remove Ovary");
                                          }
                                        });
                                      },
                                      child: text_card({
                                        "text": "Remove Ovary",
                                        "selected": _subanswers.contains("Remove Ovary")
                                      }),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if(_subanswers.contains("Remove Both Ovaries")){
                                            _subanswers.remove("Remove Both Ovaries");
                                          }
                                          else{
                                            _subanswers.add("Remove Both Ovaries");
                                          }
                                        });
                                      },
                                      child: text_card({
                                        "text": "Remove Both Ovaries",
                                        "selected": _subanswers.contains("Remove Both Ovaries")
                                      }),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if(_subanswers.contains("non-HRT")){
                                            _subanswers.remove("non-HRT");
                                          }
                                          else{
                                            _subanswers.add("non-HRT");
                                          }
                                        });
                                      },
                                      child: text_card({
                                        "text": "non-HRT",
                                        "selected": _subanswers.contains("non-HRT")
                                      }),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if(_subanswers.contains("HRT")){
                                            _subanswers.remove("HRT");
                                          }
                                          else{
                                            _subanswers.add("HRT");
                                          }
                                        });
                                      },
                                      child: text_card(
                                          {"text": "HRT", "selected": _subanswers.contains("HRT")}),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      Row(
                          // ROW 3
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: width * 0.9,
                                child: GestureDetector(
                                    onTap: () {
                                      // Get.to(Question1Yes());
                                      String value = "";
                                      if (_selected != "yes") {
                                        value = "yes";
                                      }
                                      setState(() => _selected = value);
                                    },
                                    child: Card(
                                        color: _selected == "yes"
                                            ? MyColors.orangeDew
                                            : MyColors.offWhite,
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Yes',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: MyColors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ))))
                          ]),
                      if (_selected == "yes")
                        SizedBox(
                            width: width * 0.95,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if(_subanswers.contains("Uterus removed")){
                                              _subanswers.remove("Uterus removed");
                                            }
                                            else{
                                              _subanswers.add("Uterus removed");
                                            }
                                          });
                                        },
                                        child: text_card({
                                          "text": "Uterus removed",
                                          "selected": _subanswers.contains("Uterus removed")
                                        })),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if(_subanswers.contains("Ovary Removed")){
                                            _subanswers.remove("Ovary Removed");
                                          }
                                          else{
                                            _subanswers.add("Ovary Removed");
                                          }
                                        });
                                      },
                                      child: text_card({
                                        "text": "Ovary Removed",
                                        "selected": _subanswers.contains("Ovary Removed")
                                      }),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if(_subanswers.contains("Both Ovaries Removed")){
                                            _subanswers.remove("Both Ovaries Removed");
                                          }
                                          else{
                                            _subanswers.add("Both Ovaries Removed");
                                          }
                                        });
                                      },
                                      child: text_card({
                                        "text": "Both Ovaries Removed",
                                        "selected": _subanswers.contains("Both Ovaries Removed")
                                      }),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if(_subanswers.contains("non-HRT")){
                                            _subanswers.remove("non-HRT");
                                          }
                                          else{
                                            _subanswers.add("non-HRT");
                                          }
                                        });
                                      },
                                      child: text_card({
                                        "text": "non-HRT",
                                        "selected": _subanswers.contains("non-HRT")
                                      }),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if(_subanswers.contains("HRT")){
                                            _subanswers.remove("HRT");
                                          }
                                          else{
                                            _subanswers.add("HRT");
                                          }
                                        });
                                      },
                                      child: text_card(
                                          {"text": "HRT", "selected": _subanswers.contains("HRT")}),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      SizedBox(
                        height: 75,
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
                                          questionnaireController.questions[5]= {
                                            "question_number":"5",
                                            "question":"I‘ve undergone a medical/surgical procedure related to my reproductive health",
                                            "question_answer":_selected,
                                            "question_subanswers":_subanswers.toList()
                                          };
                                          Get.to(Question6());
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
