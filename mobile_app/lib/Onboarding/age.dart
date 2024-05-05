import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/controllers/user_controller.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/main_screens/landing_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import './screen2.dart';
import './otp.dart';
import './name.dart';
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

class Age extends StatefulWidget {
  Age({super.key});

  @override
  _AgeState createState() => _AgeState();
}

class _AgeState extends State<Age> {
  UserController userController = Get.put(UserController());
  SymptomController symptomController = Get.put(SymptomController());

  int _age=45;
  @override
  void initState() {
    _age = 45;
    super.initState();
  }

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
                        child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                            color: appPalette.brightRose,
                            fontSize: 26,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w900),
                        children: [
                          TextSpan(text: 'Tell us your age!'),
                        ],
                      ),
                    )),
                    Container(
                        margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                color: appPalette.brightRose,
                                fontSize: 18,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w600),
                            children: [
                              TextSpan(
                                  text:
                                      'it helps us understand what phase of menstrual cycle you are in'),
                            ],
                          ),
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Obx(() {
                        return SizedBox(
                          height: 200,
                          child: ListWheelScrollView(
                            itemExtent: 40,
                            diameterRatio: 8,
                            children: [
                              for(var i=35;i<=60;i++)
                              listViewContainer('${i}', i),
                            ],
                            onSelectedItemChanged: (index) {
                              print("value: "+ index.toString());
                              userController.age.value = index+35;
                            },
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 150),
                    Container(
                        height: height*0.12,
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
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
                            Stack(
                              children: <Widget>[
                                Container(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                      onTap:() {
                                        Get.to(Pin());
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
        color: userController.age.value == i ? MyColors.white : null,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20,
              color: userController.age.value == i
                  ? MyColors.black
                  : MyColors.grey300),
        ),
      ),
    );
  }
}
