import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/controllers/questionnaire_controller.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/questionnaire/question1_no.dart';
import 'package:namer_app/questionnaire/question1_yes.dart';
import 'package:namer_app/questionnaire/question7.dart';
import 'package:namer_app/symptoms/low_energy.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../main_screens/landing_page.dart';
import 'package:namer_app/controllers/symptom_controller.dart';
import 'package:namer_app/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:namer_app/components/text_card.dart';

class Question6Symptom extends StatefulWidget {
  Question6Symptom({super.key});
  @override
  _Question6SymptomState createState() => _Question6SymptomState();
}

class _Question6SymptomState extends State<Question6Symptom> {
  UserController userController = Get.put(UserController());
  SymptomController symptomController = Get.put(SymptomController());
  QuestionnaireController questionnaireController = Get.put(QuestionnaireController());
  Set<String> _answers = {};
  List<String> symptoms = ["Hot Flashes", "Night Sweats", "Palpitations", "Irregular periods", "Abnormal uterine bleeding", "UTI", "Joint pain", "Headache", "Dry skin", "Migraine", "Vertigo", "Chest pain", "Bloating", "Cramps", "Bone loss", "Nausea", "Dry vagina", "Indigestion", "Weight gain", "Hair issues", "Fear of cancer"];
  @override
  void initState() {
    _answers = {};
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
                      Row(
                          //ROW 2
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('I struggle with',
                                style: TextStyle(
                                    color: MyColors.brightRose,
                                    fontSize: 20,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w500)),
                          ]),
                      SizedBox(
                          width: 350,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.start,
                                // alignment: WrapAlignment.spaceBetween,
                                children: [
                                  for(var symptom in symptoms)
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if(_answers.contains(symptom)){
                                              _answers.remove(symptom);
                                            }
                                            else{
                                              _answers.add(symptom);
                                            }
                                          });
                                        },
                                        child:
                                        text_card({"text": symptom, "selected":_answers.contains(symptom)})),
                                ],
                              )
                            ],
                          )),
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
                                          questionnaireController.questions[6.1]= {
                                            "question_number":"6.1",
                                            "question":"i_struggle_with_following_symptoms",
                                            "question_answer":_answers.toList()
                                          };
                                          Get.to(Question7());
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
