import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:namer_app/components/text_card.dart';
import 'package:namer_app/controllers/symptom_controller.dart';
import 'package:namer_app/controllers/user_controller.dart';
import 'package:namer_app/database/joint_discomfort.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/main.dart';
import 'package:namer_app/database/symptom_service.dart';

class JointDiscomfort extends StatefulWidget {
  JointDiscomfort({super.key});
  @override
  _JointDiscomfortState createState() => _JointDiscomfortState();
}

class _JointDiscomfortState extends State<JointDiscomfort> {
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
                  "Joint/Muscle discomfort",
                  style: TextStyle(
                      color: brightRose,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Where does it hurt?"),
                Obx(() {
                  return Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            symptomController.J_hurt.value = 1;
                          },
                          child: textCard("Knee",
                              symptomController.J_hurt.value == 1 ? 1 : 0)),
                      GestureDetector(
                          onTap: () {
                            symptomController.J_hurt.value = 2;
                          },
                          child: textCard("Waist",
                              symptomController.J_hurt.value == 2 ? 1 : 0)),
                      GestureDetector(
                          onTap: () {
                            symptomController.J_hurt.value = 3;
                          },
                          child: textCard("Neck",
                              symptomController.J_hurt.value == 3 ? 1 : 0)),
                      GestureDetector(
                          onTap: () {
                            symptomController.J_hurt.value = 4;
                          },
                          child: textCard("Back",
                              symptomController.J_hurt.value == 4 ? 1 : 0))
                    ],
                  );
                }),
                SizedBox(
                  height: 16,
                ),
                headingText("Onset"),
                Obx(() {
                  return Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            symptomController.J_onset.value = 1;
                          },
                          child: textCard("Abrupt",
                              symptomController.J_onset.value == 1 ? 1 : 0)),
                      GestureDetector(
                          onTap: () {
                            symptomController.J_onset.value = 2;
                          },
                          child: textCard("Gradual",
                              symptomController.J_onset.value == 2 ? 1 : 0))
                    ],
                  );
                }),
                SizedBox(
                  height: 16,
                ),
                headingText("Character"),
                Obx(() {
                  return Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                symptomController.J_char.value = 1;
                              },
                              child: textCard("Dull",
                                  symptomController.J_char.value == 1 ? 1 : 0)),
                          GestureDetector(
                              onTap: () {
                                symptomController.J_char.value = 2;
                              },
                              child: textCard("Sharp",
                                  symptomController.J_char.value == 2 ? 1 : 0)),
                          GestureDetector(
                              onTap: () {
                                symptomController.J_char.value = 3;
                              },
                              child: textCard("Tingling",
                                  symptomController.J_char.value == 3 ? 1 : 0))
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                symptomController.J_char.value = 4;
                              },
                              child: textCard("Shooting",
                                  symptomController.J_char.value == 4 ? 1 : 0)),
                          GestureDetector(
                              onTap: () {
                                symptomController.J_char.value = 5;
                              },
                              child: textCard("Sensation of heat",
                                  symptomController.J_char.value == 5 ? 1 : 0)),
                        ],
                      ),
                    ],
                  );
                }),
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
                              value: symptomController.J_severity.value,
                              onChanged: (newRating) {
                                symptomController.J_severity.value = newRating;
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
                headingText("Worst in"),
                Obx(() {
                  return Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            symptomController.J_worst.value = 1;
                          },
                          child: textCard("Morning",
                              symptomController.J_worst.value == 1 ? 1 : 0)),
                      GestureDetector(
                          onTap: () {
                            symptomController.J_worst.value = 2;
                          },
                          child: textCard("Mid-day",
                              symptomController.J_worst.value == 2 ? 1 : 0)),
                      GestureDetector(
                          onTap: () {
                            symptomController.J_worst.value = 3;
                          },
                          child: textCard("Night",
                              symptomController.J_worst.value == 3 ? 1 : 0))
                    ],
                  );
                }),
                SizedBox(
                  height: 16,
                ),
                headingText("Does the pain seem to radiate?"),
                Obx(() {
                  return Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            symptomController.J_pain.value = 1;
                          },
                          child: textCard("Yes",
                              symptomController.J_pain.value == 1 ? 1 : 0)),
                      GestureDetector(
                          onTap: () {
                            symptomController.J_pain.value = 2;
                          },
                          child: textCard("No",
                              symptomController.J_pain.value == 2 ? 1 : 0)),
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
                          symptomController.J_radiate.value = v;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 20.0, color: MyColors.lightGrey),
                          contentPadding:
                              EdgeInsets.only(left: 10.0, right: 10, bottom: 8),
                          hintText: 'If yes,where? Type here',
                        ),
                      ),
                    )),
                SizedBox(
                  height: 16,
                ),
                headingText("What relieves the pain?"),
                Container(
                    height: 50,
                    child: Card(
                      color: MyColors.white,
                      elevation: 5,
                      child: TextField(
                        onChanged: (v) {
                          symptomController.J_relieve.value = v;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 20.0, color: MyColors.lightGrey),
                          contentPadding:
                              EdgeInsets.only(left: 10.0, right: 10, bottom: 8),
                          hintText: 'Explain here',
                        ),
                      ),
                    )),
                SizedBox(
                  height: 16,
                ),
                headingText("What worsens the pain?"),
                Container(
                    height: 50,
                    child: Card(
                      color: MyColors.white,
                      elevation: 5,
                      child: TextField(
                        onChanged: (v) {
                          symptomController.J_worsen.value = v;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 20.0, color: MyColors.lightGrey),
                          contentPadding:
                              EdgeInsets.only(left: 10.0, right: 10, bottom: 8),
                          hintText: 'Explain here',
                        ),
                      ),
                    )),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });

                    final result = SymptomService().addSymptom({
                      "mobile": userController.phone_number.value,
                      "symptom_name": "joint_discomfort",
                      "symptom_fields": [
                        {
                          "name": "radiate",
                          "value": symptomController.J_radiate.value
                        },
                        {
                          "name": "relieve",
                          "value": symptomController.J_relieve.value
                        },
                        {
                          "name": "worsen",
                          "value": symptomController.J_worsen.value
                        },
                        {
                          "name": "pain",
                          "value": symptomController.J_pain.value
                        },
                        {
                          "name": "onset",
                          "value": symptomController.J_onset.value
                        },
                        {
                          "name":"worst",
                          "value": symptomController.J_worst.value
                        },
                        {
                          "name":"severity",
                          "value":symptomController.J_severity.value
                        },
                        {
                          "name":"hurt",
                          "value":symptomController.J_hurt.value
                        },
                        {
                          "name":"char",
                          "value":symptomController.J_char.value
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

  Widget listViewContainer(String text) {
    return Container(
      height: 30,
      width: double.maxFinite,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget textCard(String text, int i) {
    return Container(
      height: 45,
      child: Card(
        color: i == 1 ? MyColors.orangeDew : MyColors.cherryBlossomLight,
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
