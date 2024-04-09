import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:namer_app/components/text_card.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/main.dart';

class LowEnergy extends StatelessWidget {
  const LowEnergy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40, right: 20, left: 20),
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
                  child: Icon(Icons.arrow_back, size: 18),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Symptom Journal",
                  style: TextStyle(fontSize: 18),
                )
              ]),
              SizedBox(
                height: 16,
              ),
              Text(
                "Low Energy",
                style: TextStyle(
                    color: brightRose,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "Frequency",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  )
                ],
              ),
              Container(
                height: 80,
                width: double.maxFinite,
                child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Slider(
                          value: 10,
                          onChanged: (newRating) {},
                          max: 100,
                          min: 0,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "none",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Text(
                              "often",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "Onset",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  )
                ],
              ),
              Row(
                children: [textCard("Abrupt"), textCard("Gradual")],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "Trigger",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  )
                ],
              ),
              Row(
                children: [textCard("Yes"), textCard("No")],
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
                            fontSize: 19.0, color: MyColors.lightGrey),
                        contentPadding:
                            EdgeInsets.only(left: 10.0, right: 10, bottom: 8),
                        hintText: 'What was the trigger? Type here',
                      ),
                    ),
                  )),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "Duration",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  )
                ],
              ),
              SizedBox(
                height: 100,
                child: ListWheelScrollView(
                  itemExtent: 40, // Height of each item
                  diameterRatio: 10, // Controls the size of the wheel
                  children: [
                    Container(
                      height: 30,
                      width: double.maxFinite,
                      child: Card(
                        elevation: 5,
                        child: Center(
                          child: Text("1 day"),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: double.maxFinite,
                      child: Card(
                        elevation: 5,
                        child: Center(
                          child: Text("2 days"),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: double.maxFinite,
                      child: Card(
                        elevation: 5,
                        child: Center(
                          child: Text("3 days"),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: double.maxFinite,
                      child: Card(
                        elevation: 5,
                        child: Center(
                          child: Text("4 days"),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: double.maxFinite,
                      child: Card(
                        elevation: 5,
                        child: Center(
                          child: Text("5 days"),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: double.maxFinite,
                      child: Center(
                        child: Text("6 days"),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: double.maxFinite,
                      child: Card(
                        elevation: 5,
                        child: Center(
                          child: Text("1 week"),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: double.maxFinite,
                      child: Center(
                        child: Text("2 weeks"),
                      ),
                    )
                  ],
                  onSelectedItemChanged: (index) {},
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "Condition",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  )
                ],
              ),
              Row(
                children: [
                  textCard("Stable"),
                  textCard("Improving"),
                  textCard("Worsening")
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "Worst In",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  )
                ],
              ),
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
              Row(
                children: [
                  Text(
                    "Impact on daily life",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  )
                ],
              ),
              Container(
                height: 80,
                width: double.maxFinite,
                child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Slider(
                          value: 10,
                          onChanged: (newRating) {},
                          max: 100,
                          min: 0,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "none",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Text(
                              "a lot",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
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
    );
  }

  Widget textCard(String text) {
    return Container(
      height: 40,
      width: 100,
      child: Card(
        color: MyColors.cherryBlossomLight,
        elevation: 5,
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        )),
      ),
    );
  }
}
