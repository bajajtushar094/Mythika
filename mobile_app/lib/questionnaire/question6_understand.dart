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


class Question6Understand extends StatefulWidget{
  Question6Understand({super.key});
  @override
  _Question6UnderstandState createState() => _Question6UnderstandState();
}


class _Question6UnderstandState extends State<Question6Understand> {
  UserController userController = Get.put(UserController());
  SymptomController symptomController = Get.put(SymptomController());
  QuestionnaireController questionnaireController = Get.put(QuestionnaireController());
  String _selected="";
  Set<String> _subanswers = {};
  List<String> diet_symptoms = ["Sugar", "Caffeine", "Spicy food", "Processed food", "Alcohol"];
  List<String> sleep_symptoms = ["Mid-day nap", "Disturbed sleep", "Irregular sleep schedule"];
  List<String> physical_activity_symptoms = ["No exercise", "Intense exercise"];
  List<String> socialization_symptoms = ["Social isolation", "Social anxiety", "Relationship stress"];
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('I get affected the most by',
                                style: TextStyle(
                                    color: appPalette.brightRose,
                                    fontSize: 20,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w500))
                          ]),
                      Row(// ROW 3
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: width*0.9,
                                child: GestureDetector(
                                    onTap: (){
                                      // Get.to(Question1No());
                                      String value = "";
                                      if(_selected!="diet"){
                                        value="diet";
                                      }
                                      setState(() {
                                        _selected = value;
                                        _subanswers = {};
                                      });
                                    },
                                    child: Card(
                                        color: _selected=="diet"?MyColors.orangeDew:MyColors.offWhite,
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Diet',
                                            style: TextStyle(
                                                fontSize: 20.0, color: MyColors.black, fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        )
                                    )
                                )
                            ),
                          ]),
                      if(_selected=="diet")
                        SizedBox(
                            width: width*0.95,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Wrap(
                                  crossAxisAlignment : WrapCrossAlignment.start,
                                  children: [
                                    for(var symptom in diet_symptoms)
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if(_subanswers.contains(symptom)){
                                                _subanswers.remove(symptom);
                                              }
                                              else{
                                                _subanswers.add(symptom);
                                              }
                                            });
                                          },
                                          child:
                                          text_card({"text": symptom, "selected":_subanswers.contains(symptom)})),
                                  ],
                                )

                              ],
                            )),
                      Row(// ROW 3
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: width*0.9,
                                child: GestureDetector(
                                    onTap: (){
                                      // Get.to(Question1Yes());
                                      String value = "";
                                      if(_selected!="sleep"){
                                        value="sleep";
                                      }
                                      setState(() {
                                        _selected = value;
                                        _subanswers = {};
                                      });
                                    },
                                    child: Card(
                                        color: _selected=="sleep"?MyColors.orangeDew:MyColors.offWhite,
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Sleep',
                                            style: TextStyle(
                                                fontSize: 20.0, color: MyColors.black, fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        )
                                    )
                                )
                            ),
                          ]),
                      if(_selected=="sleep")
                        SizedBox(
                            width: width*0.95,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Wrap(
                                  crossAxisAlignment : WrapCrossAlignment.start,
                                  children: [
                                    for(var symptom in sleep_symptoms)
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if(_subanswers.contains(symptom)){
                                                _subanswers.remove(symptom);
                                              }
                                              else{
                                                _subanswers.add(symptom);
                                              }
                                            });
                                          },
                                          child:
                                          text_card({"text": symptom, "selected":_subanswers.contains(symptom)})),
                                  ],
                                )

                              ],
                            )),
                      Row(// ROW 3
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: width*0.9,
                                child: GestureDetector(
                                    onTap: (){
                                      // Get.to(Question1Yes());
                                      String value = "";
                                      if(_selected!="physical_activity"){
                                        value="physical_activity";
                                      }
                                      setState(() {
                                        _subanswers = {};
                                        _selected = value;

                                      });
                                    },
                                    child: Card(
                                        color: _selected=="physical_activity"?MyColors.orangeDew:MyColors.offWhite,
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Physical Activity',
                                            style: TextStyle(
                                                fontSize: 20.0, color: MyColors.black, fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        )
                                    )
                                )
                            )
                          ]),
                      if(_selected=="physical_activity")
                        SizedBox(
                            width: width*0.95,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Wrap(
                                  crossAxisAlignment : WrapCrossAlignment.start,
                                  children: [
                                    for(var symptom in physical_activity_symptoms)
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if(_subanswers.contains(symptom)){
                                                _subanswers.remove(symptom);
                                              }
                                              else{
                                                _subanswers.add(symptom);
                                              }
                                            });
                                          },
                                          child:
                                          text_card({"text": symptom, "selected":_subanswers.contains(symptom)})),
                                  ],
                                )
                              ],
                            )),
                      Row(// ROW 3
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: width*0.9,
                                child: GestureDetector(
                                    onTap: (){
                                      // Get.to(Question1Yes());
                                      String value = "";
                                      if(_selected!="socialization"){
                                        value="socialization";
                                      }
                                      setState(() {
                                        _subanswers = {};
                                        _selected = value;
                                      } );
                                    },
                                    child: Card(
                                        color: _selected=="socialization"?MyColors.orangeDew:MyColors.offWhite,
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Socialization',
                                            style: TextStyle(
                                                fontSize: 20.0, color: MyColors.black, fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        )
                                    )
                                )
                            )
                          ]),
                      if(_selected=="socialization")
                        SizedBox(
                            width: 350,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Wrap(
                                  crossAxisAlignment : WrapCrossAlignment.start,
                                  children: [
                                    for(var symptom in socialization_symptoms)
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if(_subanswers.contains(symptom)){
                                                _subanswers.remove(symptom);
                                              }
                                              else{
                                                _subanswers.add(symptom);
                                              }
                                            });
                                          },
                                          child:
                                          text_card({"text": symptom, "selected":_subanswers.contains(symptom)})),
                                  ],
                                )
                              ],
                            )),
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
                                          questionnaireController.questions[6.2]= {
                                            "question_number":"6.2",
                                            "question":"i_struggle_with_following_moods",
                                            "question_answer":_selected,
                                            "question_subanswers":_subanswers.toList()
                                          };
                                          Get.to(Question7());
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
