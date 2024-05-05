import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/controllers/questionnaire_controller.dart';
import 'package:namer_app/controllers/user_controller.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/main_screens/landing_page.dart';
import 'package:namer_app/questionnaire/question4.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:get/get.dart';
import 'package:namer_app/database/user_service.dart';
import 'package:namer_app/controllers/symptom_controller.dart';
import 'package:namer_app/Onboarding/pin.dart';

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

class Question3 extends StatefulWidget {
  Question3({super.key});

  @override
  _Question3State createState() => _Question3State();
}

class _Question3State extends State<Question3> {
  UserController userController = Get.put(UserController());
  SymptomController symptomController = Get.put(SymptomController());
  QuestionnaireController questionnaireController = Get.put(QuestionnaireController());
  int _date = 0;
  int _month = 0;
  int _year = 0;

  @override
  void initState() {
    // TODO: implement initState
    _date = 1;
    _month = 1;
    _year = 2013;
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
            child: SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height:50,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                color: appPalette.brightRose,
                                fontSize: 22,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400),
                            children: [
                              TextSpan(text: 'I got last period on'),
                            ],
                          ),
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          SizedBox(
                              height: 200,
                              width:50,
                              child: ListWheelScrollView(
                                itemExtent: 40,
                                diameterRatio: 8,
                                children: [
                                  for(var i=1;i<=31;i++)
                                    dateListViewContainer('${i}', i),
                                ],
                                onSelectedItemChanged: (index) {
                                  setState(() {
                                    _date = index+1;
                                  });
                                },
                              ),
                            ),
                          SizedBox(
                              height: 200,
                              width:200,
                              child: ListWheelScrollView(
                                itemExtent: 40,
                                diameterRatio: 8,
                                children: [
                                  monthListViewContainer("January", 1),
                                  monthListViewContainer("February", 2),
                                  monthListViewContainer("March", 3),
                                  monthListViewContainer("April", 4),
                                  monthListViewContainer("May", 5),
                                  monthListViewContainer("June", 6),
                                  monthListViewContainer("July", 7),
                                  monthListViewContainer("August", 8),
                                  monthListViewContainer("September", 9),
                                  monthListViewContainer("October", 10),
                                  monthListViewContainer("November", 11),
                                  monthListViewContainer("December", 12),
                                ],
                                onSelectedItemChanged: (index) {
                                  setState(() {
                                    _month = index+1;
                                  });
                                },
                              ),
                            ),
                          SizedBox(
                              height: 200,
                              width:100,
                              child: ListWheelScrollView(
                                itemExtent: 40,
                                diameterRatio: 8,
                                children: [
                                  for(var i=0;i<=10;i++)
                                    yearListViewContainer('${2013+i}', 2013+i),
                                ],
                                onSelectedItemChanged: (index) {
                                  setState(() {
                                    _year = index+2013;
                                  });
                                },
                              ),
                            )
                        ],
                      )
                    ),
                    SizedBox(height: 50),
                    Container(
                        height: height*0.12,
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.back();
                              },
                              child: Card(
                                  color: MyColors.purpleMint,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Container(
                                    height: width*0.12,
                                    width: width*0.12,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 2.0),
                                      child: Icon(Icons.arrow_back_rounded, color: MyColors.white, size: 30),
                                    ),
                                  )),
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                      onTap:() {
                                        questionnaireController.questions[3]= {
                                          "question_number":"3",
                                          "question":"age_when_i_got_my_first_period",
                                          "question_answer":_date.toString()+"/"+_month.toString()+"/"+_year.toString()
                                        };
                                        Get.to(Question4());
                                      },
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                          ),
                                          color: MyColors.purpleMint,
                                          child: Container(
                                            height: width*0.15,
                                            width: width*0.15,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.symmetric(horizontal: 2.0),
                                              child: Icon(Icons.arrow_forward_rounded, color: MyColors.white, size: 40),
                                            ),
                                          )),
                                    )

                                ),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Image.asset("assets/images/fools.png", fit: BoxFit.fill)
                                )
                              ],
                            ),

                          ],
                        )),
                    SizedBox(height: height/14),
                  ],
                ))));
  }

  Widget dateListViewContainer(String text, int i) {
    return Container(
      height: 30,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: _date== i ? MyColors.white : null,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20,
              color: _date == i
                  ? MyColors.black
                  : MyColors.grey300),
        ),
      ),
    );
  }

  Widget monthListViewContainer(String text, int i) {
    return Container(
      height: 30,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: _month == i ? MyColors.white : null,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20,
              color: _month == i
                  ? MyColors.black
                  : MyColors.grey300),
        ),
      ),
    );
  }

  Widget yearListViewContainer(String text, int i) {
    return Container(
      height: 30,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: _year == i ? MyColors.white : null,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20,
              color: _year == i
                  ? MyColors.black
                  : MyColors.grey300),
        ),
      ),
    );
  }
}
