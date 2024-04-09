import 'package:flutter/material.dart';

class FatigueScreen extends StatelessWidget {
  const FatigueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg-landing.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(child: Column(
              children: [
                Text("HI")
              ],
            ),),
      ),
    );
  }
}
