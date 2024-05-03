import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
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

class Question3 extends StatelessWidget {
  UserController userController = Get.put(UserController());
  SymptomController symptomController = Get.put(SymptomController());
  Question3({super.key});

  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.floor();
    int height = MediaQuery.of(context).size.height.floor();
    print("height: "+height.ceil().toString());
    print("width: "+width.toString());
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
                          Obx(() {
                            return SizedBox(
                              height: 200,
                              width:50,
                              child: ListWheelScrollView(
                                itemExtent: 40,
                                diameterRatio: 8,
                                children: [
                                  listViewContainer("1", 0),
                                  listViewContainer("2", 1),
                                  listViewContainer("3", 2),
                                  listViewContainer("4", 3),
                                  listViewContainer("5", 4),
                                  listViewContainer("6", 5),
                                  listViewContainer("7", 6),
                                  listViewContainer("8", 7),
                                ],
                                onSelectedItemChanged: (index) {
                                  symptomController.LE_duration.value = index;
                                },
                              ),
                            );
                          }),
                          Obx(() {
                            return SizedBox(
                              height: 200,
                              width:200,
                              child: ListWheelScrollView(
                                itemExtent: 40,
                                diameterRatio: 8,
                                children: [
                                  listViewContainer("January", 0),
                                  listViewContainer("February", 1),
                                  listViewContainer("March", 2),
                                  listViewContainer("April", 3),
                                  listViewContainer("May", 4),
                                  listViewContainer("June", 5),
                                  listViewContainer("July", 6),
                                  listViewContainer("August", 7),
                                ],
                                onSelectedItemChanged: (index) {
                                  symptomController.LE_duration.value = index;
                                },
                              ),
                            );
                          }),
                          Obx(() {
                            return SizedBox(
                              height: 200,
                              width:100,
                              child: ListWheelScrollView(
                                itemExtent: 40,
                                diameterRatio: 8,
                                children: [
                                  listViewContainer("1 day", 0),
                                  listViewContainer("2 days", 1),
                                  listViewContainer("3 days", 2),
                                  listViewContainer("4 days", 3),
                                  listViewContainer("5 days", 4),
                                  listViewContainer("6 days", 5),
                                  listViewContainer("1 week", 6),
                                  listViewContainer("2 week", 7),
                                ],
                                onSelectedItemChanged: (index) {
                                  symptomController.LE_duration.value = index;
                                },
                              ),
                            );
                          })
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
