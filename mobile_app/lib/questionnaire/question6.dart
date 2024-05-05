import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/controllers/questionnaire_controller.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/questionnaire/question1_no.dart';
import 'package:namer_app/questionnaire/question1_yes.dart';
import 'package:namer_app/questionnaire/question6_symptom.dart';
import 'package:namer_app/questionnaire/question6_understand.dart';
import 'package:namer_app/symptoms/low_energy.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../main_screens/landing_page.dart';
import 'package:namer_app/controllers/symptom_controller.dart';
import 'package:namer_app/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:namer_app/components/text_card.dart';
import 'package:namer_app/questionnaire/question6_mood.dart';


class Question6 extends StatefulWidget{
  Question6({super.key});
  @override
  _Question6State createState() => _Question6State();
}


class _Question6State extends State<Question6> {
  UserController userController = Get.put(UserController());
  SymptomController symptomController = Get.put(SymptomController());
  QuestionnaireController questionnaireController = Get.put(QuestionnaireController());
  String _selected="";
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
                                          child: Icon(Icons.arrow_forward, color: MyColors.purpleMint),
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
                          children: [
                            Container(
                              width: 300,
                              child: Text('On a regular basis, help me',
                                  style: TextStyle(
                                      color: MyColors.brightRose,
                                      fontSize: 20,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w500)),
                            ),

                          ]),
                      Row(// ROW 3
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: width*0.9,
                                child: GestureDetector(
                                    onTap: (){
                                      // Get.to(Question6Symptom());
                                      setState(() {
                                        _selected="Manage my symptoms";
                                      });
                                    },
                                    child: Card(
                                        color: _selected=="Manage my symptoms"?MyColors.orangeDew:MyColors.offWhite,
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Manage my symptoms',
                                            style: TextStyle(
                                                fontSize: 20.0, color: MyColors.black, fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        )
                                    )
                                )
                            ),
                          ]),
                      Row(// ROW 3
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: width*0.9,
                                child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        _selected="Journal my mood";
                                      });
                                    },
                                    child: Card(
                                        color: _selected=="Journal my mood"?MyColors.orangeDew:MyColors.offWhite,
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Journal my mood',
                                            style: TextStyle(
                                                fontSize: 20.0, color: MyColors.black, fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        )
                                    )
                                )
                            ),
                          ]),
                      Row(// ROW 3
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: width*0.9,
                                child: GestureDetector(
                                    onTap: (){
                                      // Get.to(Question1Yes());
                                      // Get.to(Question6Understand());
                                      setState(() {
                                        _selected="Understand what works best for me & my body";
                                      });
                                    },
                                    child: Card(
                                        color: _selected=="Understand what works best for me & my body"?MyColors.orangeDew:MyColors.offWhite,
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Understand what works best for me & my body',
                                            style: TextStyle(
                                                fontSize: 20.0, color: MyColors.black, fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        )
                                    )
                                )
                            )
                          ]),
                      SizedBox(
                        height: 75,
                      ),
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
                                          questionnaireController.questions[6]= {
                                            "question_number":"6",
                                            "question":"On a regular basis, help me",
                                            "question_answer":_selected
                                          };
                                          if(_selected=="Manage my symptoms"){
                                            Get.to(Question6Symptom());
                                          }
                                          else if(_selected=="Journal my mood"){
                                            Get.to(Question6Mood());
                                          }
                                          else if(_selected=="Understand what works best for me & my body"){
                                            Get.to(Question6Understand());
                                          }
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
                    ])
            )
        ));
  }
}
