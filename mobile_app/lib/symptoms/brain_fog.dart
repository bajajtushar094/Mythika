import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:namer_app/components/text_card.dart';
import 'package:namer_app/controllers/symptom_controller.dart';
import 'package:namer_app/controllers/user_controller.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/main.dart';
import 'package:namer_app/database/brain_fog_service.dart';
import 'package:namer_app/database/symptom_service.dart';

class BrainFog extends StatefulWidget {
  BrainFog({super.key});
  @override
  _BrainFogState createState() => _BrainFogState();
}

class _BrainFogState extends State<BrainFog> {
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
                  "Brain fog",
                  style: TextStyle(
                      color: brightRose,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
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
                              value: symptomController.B_impact.value,
                              onChanged: (newRating) {
                                symptomController.B_impact.value = newRating;
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
                headingText("Note"),
                Container(
                    height: 50,
                    child: Card(
                      color: MyColors.white,
                      elevation: 5,
                      child: TextField(
                        onChanged: (v) {
                          symptomController.B_note.value = v;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 20.0, color: MyColors.lightGrey),
                          contentPadding:
                              EdgeInsets.only(left: 10.0, right: 10, bottom: 8),
                          hintText: 'Explain the situation here',
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
                    final result = await SymptomService().addSymptom({
                      "mobile": userController.phone_number.value,
                      "symptom_name": "brain_fog",
                      "symptom_fields": [
                        {
                          "name": "impact",
                          "value": symptomController.B_impact.value
                        },
                        {
                          "name": "note",
                          "value": symptomController.B_note.value
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
}
