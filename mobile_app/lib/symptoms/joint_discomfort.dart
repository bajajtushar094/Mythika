import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:namer_app/components/text_card.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/main.dart';

class JointDiscomfort extends StatelessWidget {
  const JointDiscomfort({super.key});

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
                Row(
                  children: [
                    textCard("Knee"),
                    textCard("Waist"),
                    textCard("Neck"),
                    textCard("Back")
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Onset"),
                Row(
                  children: [textCard("Abrupt"), textCard("Gradual")],
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Character"),
                Column(
                  children: [
                    Row(
                      children: [
                        textCard("Dull"),
                        textCard("Sharp"),
                        textCard("Tingling")
                      ],
                    ),
                    Row(
                      children: [
                        textCard("Shooting"),
                        textCard("Sensation of heat"),
                      ],
                    ),
                  ],
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
                          Slider(
                            value: 10,
                            onChanged: (newRating) {},
                            max: 100,
                            min: 0,
                          ),
                          belowSlider("high")
                        ],
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Worst in"),
                Row(
                  children: [
                    textCard("Morning"),
                    textCard("Mid-day"),
                    textCard("Night")
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                headingText("Does the pain seem to radiate?"),
                Row(
                  children: [
                    textCard("Yes"),
                    textCard("No"),
                  ],
                ),
                 Container(
                    height: 50,
                    child: Card(
                      color: MyColors.white,
                      elevation: 5,
                      child: TextField(
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

  Widget textCard(String text) {
    return Container(
      height: 45,
      child: Card(
        color: MyColors.cherryBlossomLight,
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
