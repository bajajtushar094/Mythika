import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:namer_app/components/text_card.dart';
import 'package:namer_app/controllers/symptom_controller.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/main.dart';

class VaginalDryness extends StatelessWidget {
  SymptomController symptomController = Get.put(SymptomController());
  VaginalDryness({super.key});

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
                  "Vaginal dryness",
                  style: TextStyle(
                      color: brightRose,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Frequency"),
                Obx(() {
                  return SizedBox(
                    height: 100,
                    child: ListWheelScrollView(
                      itemExtent: 40, // Height of each item
                      diameterRatio: 10, // Controls the size of the wheel
                      children: [
                        listViewContainer("2 hours", 0),
                        listViewContainer("3 hours", 1),
                        listViewContainer("4 hours", 2),
                        listViewContainer("5 hours", 3),
                        listViewContainer("6 hours", 4),
                        listViewContainer("12 hours", 5),
                        listViewContainer("1 day", 6),
                        listViewContainer("2 day", 7),
                      ],
                      onSelectedItemChanged: (index) {
                        symptomController.V_frequency.value = index;
                      },
                    ),
                  );
                }),
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
                            "${symptomController.V_duration.value} days",
                            style: TextStyle(
                                fontSize: 20, color: MyColors.grey300),
                          );
                        }),
                        Expanded(child: SizedBox()),
                        GestureDetector(
                            onTap: () {
                              if (symptomController.V_duration.value > 0) {
                                symptomController.V_duration.value--;
                              }
                            },
                            child: buttonCustom(1)),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              symptomController.V_duration.value++;
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
                headingText("Severity"),
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
                              value: symptomController.V_severity.value,
                              onChanged: (newRating) {
                                symptomController.V_severity.value = newRating;
                              },
                              max: 100,
                              min: 0,
                            );
                          }),
                          belowSlider("high")
                        ],
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Impact on sexual health"),
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
                              value: symptomController.V_sexual.value,
                              onChanged: (newRating) {
                                symptomController.V_sexual.value = newRating;
                              },
                              max: 100,
                              min: 0,
                            );
                          }),
                          belowSlider("high")
                        ],
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Daily comfort"),
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
                              value: symptomController.V_daily.value,
                              onChanged: (newRating) {
                                symptomController.V_daily.value = newRating;
                              },
                              max: 100,
                              min: 0,
                            );
                          }),
                          belowSlider("comfortable")
                        ],
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: brightRose,
                      elevation: 5,
                      child: Center(
                        child: Text(
                          "Save",
                          style: TextStyle(color: MyColors.white),
                        ),
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
              color: symptomController.V_frequency.value == i
                  ? MyColors.black
                  : MyColors.grey300),
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
