import 'dart:convert';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:namer_app/Onboarding/safe_space.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/main_screens/landing_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import './screen2.dart';
import './name.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:get/get.dart';
import 'package:namer_app/controllers/symptom_controller.dart';
import 'package:namer_app/controllers/user_controller.dart';
import 'package:namer_app/database/user_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

class Pin extends StatefulWidget {
  Pin({super.key});

  @override
  _PinState createState() => _PinState();
}

class _PinState extends State<Pin> {
  UserController userController = Get.put(UserController());
  SymptomController symptomController = Get.put(SymptomController());

  String _pin = "";
  @override
  void initState() {
    _pin = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
        child: Scaffold(
            body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg-landing.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                              TextSpan(text: '4 digits that you’ll remember'),
                            ],
                          ),
                        )),
                        Container(
                            margin: const EdgeInsets.only(left: 50, right: 50),
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
                                          'Let’s set up a pin to make this safe place of yours secure and truly yours 🔒'),
                                ],
                              ),
                            )),
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                margin:
                                    const EdgeInsets.only(top: 50.0, left: 60),
                                child: Card(
                                  color: MyColors.cherryBlossomLight,
                                  elevation: 5,
                                  child: TextField(
                                    maxLength: 1,
                                    onSubmitted: (value) {
                                      String newPin = _pin + value.toString();
                                      setState(() => _pin = newPin);
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      counterText: '',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          fontSize: 20.0,
                                          color: MyColors.grey300,
                                          fontWeight: FontWeight.w400),
                                      contentPadding: EdgeInsets.all(10.0),
                                      hintText: '',
                                    ),
                                  ),
                                )),
                            Container(
                                height: 50,
                                width: 50,
                                margin:
                                    const EdgeInsets.only(top: 50.0, left: 20),
                                child: Card(
                                  color: MyColors.cherryBlossomLight,
                                  elevation: 5,
                                  child: TextField(
                                    maxLength: 1,
                                    onSubmitted: (value) {
                                      String newPin = _pin + value.toString();
                                      setState(() => _pin = newPin);
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      counterText: '',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          fontSize: 20.0,
                                          color: MyColors.grey300,
                                          fontWeight: FontWeight.w400),
                                      contentPadding: EdgeInsets.all(10.0),
                                      hintText: '',
                                    ),
                                  ),
                                )),
                            Container(
                                height: 50,
                                width: 50,
                                margin:
                                    const EdgeInsets.only(top: 50.0, left: 20),
                                child: Card(
                                  color: MyColors.cherryBlossomLight,
                                  elevation: 5,
                                  child: TextField(
                                    maxLength: 1,
                                    onSubmitted: (value) {
                                      String newPin = _pin + value.toString();
                                      setState(() => _pin = newPin);
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      counterText: '',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          fontSize: 20.0,
                                          color: MyColors.grey300,
                                          fontWeight: FontWeight.w400),
                                      contentPadding: EdgeInsets.all(10.0),
                                      hintText: '',
                                    ),
                                  ),
                                )),
                            Container(
                                height: 50,
                                width: 50,
                                margin:
                                    const EdgeInsets.only(top: 50.0, left: 20),
                                child: Card(
                                  color: MyColors.cherryBlossomLight,
                                  elevation: 5,
                                  child: TextField(
                                    maxLength: 1,
                                    onSubmitted: (value) async {
                                      String newPin = _pin + value.toString();
                                      setState(() => _pin = newPin);
                                      // Get.to(SafeSpace());

                                      context.loaderOverlay.show();
                                      final result = await UserService().addUser({
                                        "name": userController.name.value,
                                        "mobile": userController.phone_number.value,
                                        "age":userController.age.value,
                                        "pin":_pin
                                      });
                                      context.loaderOverlay.hide();

                                      if(json.decode(result.toString())['success']==true){
                                        Fluttertoast.showToast(
                                          msg: json.decode(result.toString())['message'],
                                          backgroundColor: MyColors.notificationGreen,
                                        );
                                        Get.to(SafeSpace());
                                      }
                                      else{
                                        Fluttertoast.showToast(
                                          msg: json.decode(result.toString())['message'],
                                          backgroundColor: MyColors.brightRose,
                                        );
                                      }

                                      print(result.toString());
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      counterText: '',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          fontSize: 20.0,
                                          color: MyColors.grey300,
                                          fontWeight: FontWeight.w400),
                                      contentPadding: EdgeInsets.all(10.0),
                                      hintText: '',
                                    ),
                                  ),
                                )),
                          ],
                        )
                      ],
                    )))));
  }
}
