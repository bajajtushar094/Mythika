import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:namer_app/globals/colors.dart';

class text_card extends StatelessWidget {
  text_card(this.data);
  final data;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        margin: const EdgeInsets.only(
            left: 10.0, bottom: 5.0),
        child: Card(
            color: data["selected"]?MyColors.brightRose:MyColors.cherryBlossomLight,
            elevation: 5,
            child: SizedBox(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                        data["text"],
                        style: TextStyle(
                            fontSize: 20, color: data["selected"]?MyColors.white:MyColors.black
                        )
                    )
                )
            )
        )
    );
  }
}