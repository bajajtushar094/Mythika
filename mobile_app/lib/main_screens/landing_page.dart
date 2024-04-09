import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import "../components/calendar_card.dart";
import "../components/emoji_card.dart";
import "../components/text_card.dart";

class AppPalette {
  // Red
  Color brightRose = HexColor("#DA2942");
  Color orangeDew = HexColor("#FFBE71");
  Color purpleMint = HexColor("#B75CEE");
  Color black = HexColor("#000000");
  Color offWhite = HexColor("#FFFFF0");
  Color cherryBlossomLight = HexColor("#FFEFF1");
  Color white = HexColor("#FFFFFF");
  Color lightGrey = HexColor("#B9B9B9");
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

class landing_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg-landing.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SafeArea(
                    child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Text('Mythika',
                                    style: TextStyle(
                                        color: appPalette.brightRose,
                                        fontSize: 28,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                            Container(
                                height: 100,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: new List.generate(10, (int index) {
                                    index++;
                                    return calender_card(
                                        {"day": "Mon", "date": "$index"});
                                  }),
                                )),
                            Container(
                                child: Card(
                                    color: appPalette.offWhite,
                                    child: SizedBox(
                                        height: 310,
                                        width: 350,
                                        child: Column(
                                          children: <Widget>[
                                            Row(children: [
                                              Container(
                                                  height: 140,
                                                  width: 140,
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Text('🩷',
                                                          style: TextStyle(
                                                              fontSize: 96))))
                                            ]),
                                            Row(children: [
                                              Container(
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              25.0),
                                                      child: Text(
                                                          'You are on 3-day streak!',
                                                          style: TextStyle(
                                                              fontSize: 24,
                                                              color: appPalette
                                                                  .black))))
                                            ]),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 250,
                                                  height: 50,
                                                  margin: EdgeInsets.only(
                                                      left: 30.0),
                                                  child: TextButton(
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    appPalette
                                                                        .orangeDew),
                                                        foregroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    appPalette
                                                                        .brightRose),
                                                      ),
                                                      onPressed: () {
                                                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen1()));
                                                      },
                                                      child: RichText(
                                                        text: TextSpan(
                                                          style: TextStyle(
                                                              color: appPalette
                                                                  .brightRose,
                                                              fontSize: 18,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                          children: [
                                                            TextSpan(
                                                                text:
                                                                    'Generate Summary'),
                                                            WidgetSpan(
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        2.0),
                                                                child: Icon(Icons
                                                                    .insights),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                      //Text('TextButton' , style: TextStyle(color: appPalette.brightRose, fontSize: 18, decoration: TextDecoration.none)),
                                                      ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )))),
                            Container(
                                margin: const EdgeInsets.only(top: 10.0),
                                child: Card(
                                    color: appPalette.offWhite,
                                    child: SizedBox(
                                        height: 130,
                                        width: 350,
                                        child: Column(
                                          children: <Widget>[
                                            Row(children: [
                                              Container(
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 25.0,
                                                              bottom: 5.0,
                                                              left: 25.0),
                                                      child: Text('Mood',
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: appPalette
                                                                  .black))))
                                            ]),
                                            Container(
                                                height: 50,
                                                child: ListView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  children: new List.generate(
                                                      10, (int index) {
                                                    index++;
                                                    return emoji_card({
                                                      "day": "Mon",
                                                      "date": "$index"
                                                    });
                                                  }),
                                                ))
                                          ],
                                        )))),
                            Container(
                                margin: const EdgeInsets.only(top: 10.0),
                                child: Card(
                                    color: appPalette.offWhite,
                                    child: SizedBox(
                                        height: 130,
                                        width: 350,
                                        child: Column(
                                          children: <Widget>[
                                            Row(children: [
                                              Container(
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 25.0,
                                                              bottom: 5.0,
                                                              left: 25.0),
                                                      child: Text('Want to talk?',
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: appPalette
                                                                  .black))))
                                            ]),
                                            Container(
                                              height: 50,
                                              margin: const EdgeInsets.only(
                                                  left: 10.0, right: 10.0),
                                              child: Card(
                                                color: appPalette.white,
                                                elevation: 5,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintStyle: TextStyle(fontSize: 20.0, color: appPalette.lightGrey),
                                                    contentPadding: EdgeInsets.all(10.0),
                                                    hintText:
                                                    'Enter a search term',
                                                  ),
                                                ),
                                              )
                                            )
                                          ],
                                        )))),
                            Container(
                                margin: const EdgeInsets.only(top: 10.0),
                                child: Card(
                                    color: appPalette.offWhite,
                                    child: SizedBox(
                                        height: 400,
                                        width: 350,
                                        child: Column(
                                          children: <Widget>[
                                            Row(children: [
                                              Container(
                                                width:275,
                                                  child: Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          top: 25.0,
                                                          bottom: 5.0,
                                                          left: 25.0),
                                                      child: Text('Which one of these trouble you the most?',
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: appPalette
                                                                  .black))))
                                            ]),
                                            Row(children: [
                                              text_card({"text":"Low energy"}),
                                              text_card({"text":"Low energy"})
                                            ],)

                                          ],
                                        )))),
                          ],
                        ))))));
  }
}
