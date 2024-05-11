import 'dart:convert';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/controllers/user_controller.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/globals/fonts.dart';
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
import 'package:fluttertoast/fluttertoast.dart';
import 'package:namer_app/Onboarding/safe_space.dart';
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

class phone_number extends StatelessWidget {
  UserController userController = Get.put(UserController());
  phone_number({super.key});

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
            child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: width*0.15),
                        width: width*0.7,
                        child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                            color: appPalette.brightRose).merge(FontStyles.text26Bold),
                        children: [
                          TextSpan(text: 'Ready, set, go!'),
                        ],
                      ),
                    )),
                    Container(
                        margin: EdgeInsets.only(left: width*0.15),
                        width: width*0.7,
                        child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                            color: appPalette.brightRose).merge(FontStyles.text20),
                        children: [
                          TextSpan(
                              text: 'Let us log into this safe place of yours ☺️'),
                        ],
                      ),
                    )),
                    Container(
                        height: height*0.07,
                        width: width*0.9,
                        margin: EdgeInsets.only(top: height*0.05, left: width*0.05),
                        child: Card(
                          color: MyColors.cherryBlossomLight,
                          elevation: 5,
                          child: TextField(
                            onSubmitted: (value) async {
                              userController.phone_number.value = value;
                              final result = await UserService()
                                  .checkUserExists(
                                      phone_number:
                                          userController.phone_number.value);
                              // print("result from check User: "+ result.toString());
                              if (json.decode(result.toString())['success']) {
                                Fluttertoast.showToast(
                                  msg: "User Exists",
                                  backgroundColor: MyColors.notificationGreen,
                                );
                                Get.to(Pin());
                              } else {
                                Fluttertoast.showToast(
                                  msg: "User does not exists",
                                  backgroundColor: MyColors.brightRose,
                                );
                                Get.to(otp());
                              }
                              // Get.to(otp());
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: MyColors.grey300).merge(FontStyles.text20),
                              contentPadding: EdgeInsets.all(10.0),
                              hintText: 'Please enter your phone number',
                            ),
                          ),
                        ))
                  ],
                ))));
  }
}
