import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/Onboarding/know_better.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import './screen2.dart';
import 'package:namer_app/controllers/symptom_controller.dart';
import 'package:get/get.dart';
import 'package:namer_app/controllers/user_controller.dart';
import 'package:namer_app/globals/colors.dart';

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

class SafeSpace extends StatelessWidget {
  SafeSpace({super.key});
  SymptomController symptomController = Get.put(SymptomController());
  UserController userController = Get.put(UserController());


  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.floor();
    int height = MediaQuery.of(context).size.height.floor();
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg-landing.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/safe_space_fool.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(//ROW 2
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Container(
                      width: 300,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Entering your safe space, ${userController.name.value}...',
                              style: TextStyle(
                                  color: appPalette.brightRose,
                                  fontSize: 24,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w900)),
                        ))
                  ]),
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
                                      Get.to(KnowBetter());
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
                ])));
  }
}
