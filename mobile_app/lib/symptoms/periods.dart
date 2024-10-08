import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:namer_app/components/text_card.dart';
import 'package:namer_app/controllers/symptom_controller.dart';
import 'package:namer_app/controllers/user_controller.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/main.dart';
import 'package:namer_app/database/symptom_service.dart';

class Periods extends StatefulWidget {
  Periods({super.key});
  @override
  _PeriodsState createState() => _PeriodsState();
}

class _PeriodsState extends State<Periods> {
  SymptomController symptomController = Get.put(SymptomController());
  UserController userController = Get.put(UserController());
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg-landing.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: MyColors.purpleMint,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Symptom Journal",
                    style: TextStyle(fontSize: 18, color: MyColors.purpleMint),
                  )
                ]),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Periods",
                  style: TextStyle(
                      color: brightRose,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Once in"),
                Container(
                  height: 80,
                  width: double.maxFinite,
                  child: Card(
                    color: MyColors.white,
                    elevation: 5,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Obx(() {
                          return Text(
                            "${symptomController.P_once.value} days",
                            style: TextStyle(
                                fontSize: 20, color: MyColors.grey300),
                          );
                        }),
                        Expanded(child: SizedBox()),
                        GestureDetector(
                            onTap: () {
                              if (symptomController.P_once.value > 0) {
                                symptomController.P_once.value--;
                              }
                            },
                            child: buttonCustom(1)),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              symptomController.P_once.value++;
                            },
                            child: buttonCustom(2)),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Duration"),
                Container(
                  height: 80,
                  width: double.maxFinite,
                  child: Card(
                    color: MyColors.white,
                    elevation: 5,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Obx(() {
                          return Text(
                            "${symptomController.P_duration.value} days",
                            style: TextStyle(
                                fontSize: 20, color: MyColors.grey300),
                          );
                        }),
                        Expanded(child: SizedBox()),
                        GestureDetector(
                            onTap: () {
                              if (symptomController.P_duration.value > 0) {
                                symptomController.P_duration.value--;
                              }
                            },
                            child: buttonCustom(1)),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              symptomController.P_duration.value++;
                            },
                            child: buttonCustom(2)),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("No. of pads/tampons used a day"),
                Container(
                  height: 80,
                  width: double.maxFinite,
                  child: Card(
                    color: MyColors.white,
                    elevation: 5,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Obx(() {
                          return Text(
                            "${symptomController.P_pads.value}",
                            style: TextStyle(
                                fontSize: 20, color: MyColors.grey300),
                          );
                        }),
                        Expanded(child: SizedBox()),
                        GestureDetector(
                            onTap: () {
                              if (symptomController.P_pads.value > 0) {
                                symptomController.P_pads.value--;
                              }
                            },
                            child: buttonCustom(1)),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              symptomController.P_pads.value++;
                            },
                            child: buttonCustom(2)),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Impact on daily life"),
                Container(
                  height: 80,
                  width: double.maxFinite,
                  child: Card(
                      color: MyColors.white,
                      elevation: 5,
                      child: Column(
                        children: [
                          Obx(() {
                            return Slider(
                              value: symptomController.P_impact.value,
                              onChanged: (newRating) {
                                symptomController.P_impact.value = newRating;
                              },
                              max: 100,
                              min: 0,
                            );
                          }),
                          belowSlider("a lot")
                        ],
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Pain"),
                Container(
                  height: 80,
                  width: double.maxFinite,
                  child: Card(
                      color: MyColors.white,
                      elevation: 5,
                      child: Column(
                        children: [
                          Obx(() {
                            return Slider(
                              value: symptomController.P_pain.value,
                              onChanged: (newRating) {
                                symptomController.P_pain.value = newRating;
                              },
                              max: 100,
                              min: 0,
                            );
                          }),
                          belowSlider("a lot")
                        ],
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLoading = true;
                    });

                    final result = SymptomService().addSymptom({
                      "mobile": userController.phone_number.value,
                      "symptom_name": "periods",
                      "symptom_fields": [
                        {
                          "name": "once",
                          "value": symptomController.P_once.value
                        },
                        {
                          "name": "duration",
                          "value": symptomController.P_duration.value
                        },
                        {
                          "name": "pads",
                          "value": symptomController.P_pads.value
                        },
                        {
                          "name": "impact",
                          "value": symptomController.P_impact.value
                        },
                        {
                          "name": "pain",
                          "value": symptomController.P_pain.value
                        }
                      ]
                    });

                    setState(() {
                      isLoading = false;
                    });


                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: brightRose,
                      elevation: 5,
                      child: Center(
                        child: isLoading
                            ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : const Text('Submit',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonCustom(int i) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: MyColors.purpleMint, borderRadius: BorderRadius.circular(25)),
      child: Icon(
        i == 1 ? Icons.remove : Icons.add,
        color: MyColors.white,
      ),
    );
  }

  Row headingText(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        )
      ],
    );
  }

  Row belowSlider(String text) {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Text(
          "none",
          style: TextStyle(color: MyColors.grey300),
        ),
        Expanded(
          child: SizedBox(),
        ),
        Text(
          text,
          style: TextStyle(color: MyColors.grey300),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
