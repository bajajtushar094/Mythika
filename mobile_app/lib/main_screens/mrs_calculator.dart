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
import 'package:namer_app/controllers/mrs_controller.dart';

class MRSCalculator extends StatefulWidget {
  MRSCalculator({super.key});
  @override
  _MRSCalculatorState createState() => _MRSCalculatorState();
}

class _MRSCalculatorState extends State<MRSCalculator> {
  SymptomController symptomController = Get.put(SymptomController());
  UserController userController = Get.put(UserController());
  MRSController mrsController = Get.put(MRSController());
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
                  "MRS Calculator",
                  style: TextStyle(
                      color: brightRose,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Brain Fog"),
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
                              value: mrsController.MRS_brain_fog.value,
                              onChanged: (newRating) {
                                mrsController.MRS_brain_fog.value = newRating;
                              },
                              max: 4,
                              min: 0,
                              divisions: 4,
                              label: mrsController.MRS_brain_fog.value.toString()
                            );
                          }),
                          belowSlider("severe")
                        ],
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Hot Flashes"),
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
                              value: mrsController.MRS_hot_flashes.value,
                              onChanged: (newRating) {
                                mrsController.MRS_hot_flashes.value = newRating;
                              },
                              max: 4,
                              min: 0,
                              divisions: 4,
                              label: mrsController.MRS_hot_flashes.value.toString()
                            );
                          }),
                          belowSlider("severe")
                        ],
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Joint Discomfort"),
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
                              value: mrsController.MRS_joint_discomfort.value,
                              onChanged: (newRating) {
                                mrsController.MRS_joint_discomfort.value = newRating;
                              },
                              max: 4,
                              min: 0,
                              divisions: 4,
                              label: mrsController.MRS_joint_discomfort.value.toString()
                            );
                          }),
                          belowSlider("severe")
                        ],
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Low Energy"),
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
                              value: mrsController.MRS_low_energy.value,
                              onChanged: (newRating) {
                                mrsController.MRS_low_energy.value = newRating;
                              },
                              max: 4,
                              min: 0,
                              divisions:4,
                              label: mrsController.MRS_low_energy.value.toString()
                            );
                          }),
                          belowSlider("severe")
                        ],
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Night Sweats"),
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
                              value: mrsController.MRS_night_sweats.value,
                              onChanged: (newRating) {
                                mrsController.MRS_night_sweats.value = newRating;
                              },
                              max: 4,
                              min: 0,
                              divisions: 4,
                              label: mrsController.MRS_night_sweats.value.toString()
                            );
                          }),
                          belowSlider("severe")
                        ],
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Periods"),
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
                              value: mrsController.MRS_periods.value,
                              onChanged: (newRating) {
                                mrsController.MRS_periods.value = newRating;
                              },
                              max: 4,
                              min: 0,
                              divisions: 4,
                              label: mrsController.MRS_periods.value.toString()
                            );
                          }),
                          belowSlider("severe")
                        ],
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Skin Rashes"),
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
                              value: mrsController.MRS_skin_rashes.value,
                              onChanged: (newRating) {
                                mrsController.MRS_skin_rashes.value = newRating;
                              },
                              max: 4,
                              min: 0,
                              divisions: 4,
                              label: mrsController.MRS_skin_rashes.value.toString()
                            );
                          }),
                          belowSlider("severe")
                        ],
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Vaginal Dryness"),
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
                              value: mrsController.MRS_vaginal_dryness.value,
                              onChanged: (newRating) {
                                mrsController.MRS_vaginal_dryness.value = newRating;
                              },
                              max: 4,
                              min: 0,
                              divisions: 4,
                              label: mrsController.MRS_vaginal_dryness.value.toString()
                            );
                          }),
                          belowSlider("severe")
                        ],
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Weight Changes"),
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
                              value: mrsController.MRS_weight_changes.value,
                              onChanged: (newRating) {
                                mrsController.MRS_weight_changes.value = newRating;
                              },
                              max: 4,
                              min: 0,
                              divisions: 4,
                              label: mrsController.MRS_weight_changes.value.toString()
                            );
                          }),
                          belowSlider("severe")
                        ],
                      )),
                ),
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
                      "symptom_name": "hot_flashes",
                      "symptom_fields": [
                        {
                          "name": "intensity",
                          "value": symptomController.H_intensity.value
                        },
                        {
                          "name": "sleep",
                          "value": symptomController.H_sleep.value
                        },
                        {
                          "name": "daily_life",
                          "value": symptomController.H_daily.value
                        },
                        {
                          "name": "frequency",
                          "value": symptomController.H_frequency.value
                        },
                        {
                          "name": "tracking",
                          "value": symptomController.H_tracking.value
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

  Widget listViewContainer(String text, int i) {
    return Container(
      height: 30,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: symptomController.H_frequency.value == i ? MyColors.white : null,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20,
              color: symptomController.H_frequency.value == i
                  ? MyColors.black
                  : MyColors.grey300),
        ),
      ),
    );
  }
}