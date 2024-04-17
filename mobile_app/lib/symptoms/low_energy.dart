import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:namer_app/components/text_card.dart';
import 'package:namer_app/controllers/symptom_controller.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/main.dart';

class LowEnergy extends StatelessWidget {
  SymptomController symptomController = Get.put(SymptomController());
  LowEnergy({super.key});

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
                  "Low Energy",
                  style: TextStyle(
                      color: brightRose,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Frequency"),
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
                              value: symptomController.LE_freq.value,
                              onChanged: (newRating) {
                                symptomController.LE_freq.value = newRating;
                              },
                              max: 100,
                              min: 0,
                            );
                          }),
                          belowSlider("often")
                        ],
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Onset"),
                Obx(() {
                  return Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            symptomController.LE_onset.value = 1;
                          },
                          child: textCard("Abrupt",
                              symptomController.LE_onset.value == 1 ? 1 : 0)),
                      GestureDetector(
                          onTap: () {
                            symptomController.LE_onset.value = 2;
                          },
                          child: textCard("Gradual",
                              symptomController.LE_onset.value == 2 ? 1 : 0))
                    ],
                  );
                }),
                SizedBox(
                  height: 16,
                ),
                headingText("Trigger"),
                Obx(() {
                  return Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            symptomController.LE_trigger.value = 1;
                          },
                          child: textCard("Yes",
                              symptomController.LE_trigger.value == 1 ? 1 : 0)),
                      GestureDetector(
                          onTap: () {
                            symptomController.LE_trigger.value = 2;
                          },
                          child: textCard("No",
                              symptomController.LE_trigger.value == 2 ? 1 : 0)),
                    ],
                  );
                }),
                Container(
                    height: 50,
                    child: Card(
                      color: MyColors.white,
                      elevation: 5,
                      child: TextField(
                        onChanged: (v) {
                          symptomController.LE_text.value = v;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 20.0, color: MyColors.lightGrey),
                          contentPadding:
                              EdgeInsets.only(left: 10.0, right: 10, bottom: 8),
                          hintText: 'What was the trigger? Type here',
                        ),
                      ),
                    )),
                SizedBox(
                  height: 16,
                ),
                headingText("Duration"),
                Obx(() {
                  return SizedBox(
                    height: 100,
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
                }),
                SizedBox(
                  height: 16,
                ),
                headingText("Condition"),
                Obx(() {
                  return Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                symptomController.LE_condition.value = 1;
                              },
                              child: textCard(
                                  "Stable",
                                  symptomController.LE_condition.value == 1
                                      ? 1
                                      : 0)),
                          GestureDetector(
                              onTap: () {
                                symptomController.LE_condition.value = 2;
                              },
                              child: textCard(
                                  "Improving",
                                  symptomController.LE_condition.value == 2
                                      ? 1
                                      : 0)),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                symptomController.LE_condition.value = 3;
                              },
                              child: textCard(
                                  "Worsening",
                                  symptomController.LE_condition.value == 3
                                      ? 1
                                      : 0)),
                        ],
                      )
                    ],
                  );
                }),
                SizedBox(
                  height: 16,
                ),
                headingText("Worst In"),
                Obx(() {
                  return Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            symptomController.LE_worst.value = 1;
                          },
                          child: textCard("Morning",
                              symptomController.LE_worst.value == 1 ? 1 : 0)),
                      GestureDetector(
                          onTap: () {
                            symptomController.LE_worst.value = 2;
                          },
                          child: textCard("Mid-day",
                              symptomController.LE_worst.value == 2 ? 1 : 0)),
                      GestureDetector(
                          onTap: () {
                            symptomController.LE_worst.value = 3;
                          },
                          child: textCard("Night",
                              symptomController.LE_worst.value == 3 ? 1 : 0))
                    ],
                  );
                }),
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
                              value: symptomController.LE_impact.value,
                              onChanged: (newRating) {
                                symptomController.LE_impact.value = newRating;
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

  Widget textCard(String text, int i) {
    return Container(
      height: 45,
      child: Card(
        color: i == 0 ? MyColors.cherryBlossomLight : MyColors.orangeDew,
        elevation: 5,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 5.0, bottom: 5, left: 10, right: 10),
          child: Center(
              child: Text(
            text,
            style: TextStyle(fontSize: 20),
          )),
        ),
      ),
    );
  }
}
