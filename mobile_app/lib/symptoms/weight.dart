import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:namer_app/components/text_card.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/main.dart';

class WeightChanges extends StatelessWidget {
  const WeightChanges({super.key});

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
                  "Weight changes",
                  style: TextStyle(
                      color: brightRose,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Earlier body weight"),
                SizedBox(
                  height: 100,
                  child: ListWheelScrollView(
                    itemExtent: 40,
                    diameterRatio: 10,
                    children: List.generate(
                      51, // Number of items (100 - 50 + 1)
                      (index) => listViewContainer("${index + 50} kg"),
                    ),
                    onSelectedItemChanged: (index) {},
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Later body weight"),
                SizedBox(
                  height: 100,
                  child: ListWheelScrollView(
                    itemExtent: 40,
                    diameterRatio: 10,
                    children: List.generate(
                      51, // Number of items (100 - 50 + 1)
                      (index) => listViewContainer("${index + 50} kg"),
                    ),
                    onSelectedItemChanged: (index) {},
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Time in between"),
                SizedBox(
                  height: 100,
                  child: ListWheelScrollView(
                    itemExtent: 40, // Height of each item
                    diameterRatio: 10, // Controls the size of the wheel
                    children: [
                      listViewContainer("1 day"),
                      listViewContainer("2 days"),
                      listViewContainer("3 days"),
                      listViewContainer("4 days"),
                      listViewContainer("5 days"),
                      listViewContainer("6 days"),
                      listViewContainer("1 week"),
                      listViewContainer("2 week"),
                    ],
                    onSelectedItemChanged: (index) {},
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Impact"),
                Container(
                  height: 80,
                  width: double.maxFinite,
                  child: Card(
                      color: MyColors.white,
                      elevation: 5,
                      child: Column(
                        children: [
                          Slider(
                            value: 10,
                            onChanged: (newRating) {},
                            max: 100,
                            min: 0,
                          ),
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
}
