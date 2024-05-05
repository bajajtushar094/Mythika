import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/controllers/questionnaire_controller.dart';
import 'package:namer_app/database/questionnaire_service.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/model/Questionnaire.dart';
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

class Question1 extends StatefulWidget {
  Question1({super.key});

  @override
  _Question1State createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  UserController userController = Get.put(UserController());
  SymptomController symptomController = Get.put(SymptomController());
  QuestionnaireController questionnaireController = Get.put(QuestionnaireController());

  String _answer = "";
  @override
  void initState() {
    _answer = "";
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
                              GestureDetector(
                                  onTap: () {
                                    Get.to(landing_page());
                                  },
                                  child: RichText(
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
                                  )))
                            ],
                          )),
                      Container(
                        width: 375,
                        height: 300,
                      ),
                      Row(
                          //ROW 2
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 300,
                              child: Text(
                                  '${userController.name.value}, do you get periods?',
                                  style: TextStyle(
                                      color: appPalette.brightRose,
                                      fontSize: 24,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ]),
                      Row(
                          // ROW 3
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: width * 0.9,
                                child: GestureDetector(
                                    onTap: () async {
                                      setState(() => _answer = "yes");
                                    },
                                    child: Card(
                                        color: _answer=="yes"?MyColors.orangeDew:MyColors.offWhite,
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
                                      // Get.to(Question1No());
                                      setState(() => _answer = "no");
                                    },
                                    child: Card(
                                        color: _answer=="no"?MyColors.orangeDew:MyColors.offWhite,
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
                      Expanded(child: Container()),
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
                                        onTap: () async {
                                          // Get.to(Question3());
                                          // final result =
                                          //     await QuestionnaireService()
                                          //     .addQuestion({
                                          //   "mobile":
                                          //   userController.phone_number.value,
                                          //   "question_number": "1",
                                          //   "question": "do_you_get_periods?",
                                          //   "question_answer": _answer
                                          // });
                                          questionnaireController.questions[1]= {
                                            "question_number":"1",
                                            "question":"do_you_get_periods?",
                                            "question_answer":_answer
                                          };

                                          if(_answer=="yes"){
                                            Get.to(Question1Yes());
                                          }
                                          else{
                                            Get.to(Question1No());
                                          }
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
