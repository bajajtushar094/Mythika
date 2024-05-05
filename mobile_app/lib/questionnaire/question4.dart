import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/controllers/questionnaire_controller.dart';
import 'package:namer_app/controllers/user_controller.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/main_screens/landing_page.dart';
import 'package:namer_app/questionnaire/question3.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:get/get.dart';
import 'package:namer_app/database/user_service.dart';
import 'package:namer_app/controllers/symptom_controller.dart';
import 'package:namer_app/Onboarding/pin.dart';
import 'package:namer_app/questionnaire/question5.dart';

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

class Question4 extends StatefulWidget{
  Question4({super.key});

  @override
  _Question4State createState() => _Question4State();
}

class _Question4State extends State<Question4> {
  UserController userController = Get.put(UserController());
  SymptomController symptomController = Get.put(SymptomController());
  QuestionnaireController questionnaireController = Get.put(QuestionnaireController());
  String _answer = "";

  @override
  void initState() {
    // TODO: implement initState
    _answer="";
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
                              TextSpan(text: 'My period lasts for around'),
                            ],
                          ),
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Obx(() {
                        return SizedBox(
                          height: 200,
                          child: ListWheelScrollView(
                            itemExtent: 40,
                            diameterRatio: 8,
                            children: [
                              listViewContainer("1 day", 1),
                              listViewContainer("2 days", 2),
                              listViewContainer("3 days", 3),
                              listViewContainer("4 days", 4),
                              listViewContainer("5 days", 5),
                              listViewContainer("6 days", 6)
                            ],
                            onSelectedItemChanged: (index) {
                              symptomController.LE_duration.value = index+1;
                            },
                          ),
                        );
                      }),
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
                                        questionnaireController.questions[4]= {
                                          "question_number":"4",
                                          "question":"my_period_lasts_for_around",
                                          "question_answer":_answer
                                        };
                                        Get.to(Question5());
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

  Widget listViewContainer(String text, int i) {
    return Container(
      height: 30,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: symptomController.LE_duration.value == i ? MyColors.white : null,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20,
              color: symptomController.LE_duration.value == i
                  ? MyColors.black
                  : MyColors.grey300),
        ),
      ),
    );
  }
}
