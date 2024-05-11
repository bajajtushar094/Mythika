import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/Onboarding/age.dart';
import 'package:namer_app/controllers/user_controller.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:namer_app/globals/fonts.dart';
import 'package:namer_app/main_screens/landing_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import './screen2.dart';
import '../main_screens/landing_page.dart';
import 'package:namer_app/globals/colors.dart';
import 'package:get/get.dart';
import "package:namer_app/database/user_service.dart";
import 'package:loader_overlay/loader_overlay.dart';

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

class name extends StatelessWidget {
  UserController userController = Get.put(UserController());
  name({super.key});


  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.floor();
    int height = MediaQuery.of(context).size.height.floor();
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: width*0.1),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: appPalette.brightRose).merge(FontStyles.text22),
                                children: [
                                  TextSpan(text: 'What should we call you?'),
                                ],
                              ),
                            )),
                        Container(
                            height: height*0.07,
                            width: width*0.9,
                            margin: const EdgeInsets.only(
                                top: 50.0, left: 20, right: 20),
                            child: Card(
                              color: MyColors.cherryBlossomLight,
                              elevation: 5,
                              child: TextField(
                                style: TextStyle(color: MyColors.black).merge(FontStyles.text18),
                                onSubmitted: (value) async {
                                  userController.name.value = value;
                                  // context.loaderOverlay.show();
                                  // final result = await UserService().addUser(
                                  //     name: userController.name.value,
                                  //     phone_number: userController.phone_number.value
                                  // );
                                  // context.loaderOverlay.hide();
                                  // print("results from adding user: "+result.toString());
                                  Get.to(Age());
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: MyColors.grey300).merge(FontStyles.text18),
                                  contentPadding: EdgeInsets.only(left:10.0),
                                  hintText: 'Type your name here, pretty',
                                ),
                              ),
                            ))
                      ],
                    ))))
    );
  }
}
