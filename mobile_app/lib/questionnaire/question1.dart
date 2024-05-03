import 'package:english_words/english_words.dart';
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

class Question1 extends StatelessWidget {
  UserController userController = Get.put(UserController());
  SymptomController symptomController = Get.put(SymptomController());
  Question1({super.key});
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
                              child: Text('${userController.name.value}, do you get periods?',
                                  style: TextStyle(
                                      color: appPalette.brightRose,
                                      fontSize: 24,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w400)),
                            ),

                          ]),
                      Row(// ROW 3
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: width*0.9,
                              child: GestureDetector(
                                onTap: (){
                                  Get.to(Question1Yes());
                                },
                               child: Card(
                                   color: MyColors.offWhite,
                                   elevation: 5,
                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Text(
                                       'Yes',
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
                                    Get.to(Question1No());
                                  },
                                  child: Card(
                                      color: MyColors.offWhite,
                                      elevation: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'No',
                                          style: TextStyle(
                                              fontSize: 20.0, color: MyColors.black, fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      )
                                  )
                                )
                            ),
                          ]),
                    ])
            )
        ));
  }
}