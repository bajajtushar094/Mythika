import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/Onboarding/phone_number.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import './Onboarding/screen1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:namer_app/globals/fonts.dart';

const Color primaryColor = Color(0xFF0A74DA);
String brightRoseString = "#DA2942";
Color brightRose = HexColor("#DA2942");

final appTheme = {brightRose: brightRose};

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

void main() async {
  // runApp(MyApp());
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home:  LoaderOverlay(child:MyHomePage()),
    theme: ThemeData(useMaterial3: true),
  ));
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> content = [];
  int _index = 0;
  @override
  void initState() {
    // TODO: implement initState
    _index = 0;
    content = [
      {
        "bg_image":"assets/images/Welcome.png",
        "title":"Welcome To Mythika, ",
        "subtitle":"your companion for menopause ✨",
        "button":"Explore"
      },
      {
        "bg_image":"assets/images/journal.png",
        "title":"Learn more about yourself,",
        "subtitle":"Journal your health, mood & thoughts daily 📝",
        "button":"Next"
      },
      {
        "bg_image":"assets/images/menopause.png",
        "title":"Learn more about menopause,",
        "subtitle":"Understand menopause & how it affects you 🌸",
        "button":"Next"
      },
      {
        "bg_image":"assets/images/gynecology.png",
        "title":"Get help of professionals",
        "subtitle":"Convert your daily journal into reports 📖",
        "button":"Next"
      },
      {
        "bg_image":"assets/images/getstarted.png",
        "title":"Let’s start this journey together",
        "subtitle":"and make Mythika your safe space️ ✨",
        "button":"Get Started"
      },
      {
        "bg_image":"assets/images/getstarted.png",
        "title":"Let’s start this journey together",
        "subtitle":"and make Mythika your safe space️",
        "button":"Get Started"
      },
    ];
    super.initState();
  }
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    //ROW 1
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width*1.0,
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(content[_index]['bg_image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(//ROW 2
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                        width: width*0.75,
                          margin: EdgeInsets.only(left: width*0.15, top: height*0.08),
                        child: Text(content[_index]['title'],
                              style: TextStyle(
                                  color: appPalette.brightRose).merge(FontStyles.text26Bold)),
                        )
                  ]),
                  Row(//ROW 2
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    Container(
                        width: width*0.75,
                        margin: EdgeInsets.only(left: width*0.15),
                        child: Text(content[_index]['subtitle'],
                              style: TextStyle(
                                  color: appPalette.brightRose).merge(FontStyles.text18)),
                        )
                  ]),
                  Row(// ROW 3
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    Container(
                      width: 175,
                      margin: EdgeInsets.only(top: height*0.10, left: width*0.15),
                      child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                appPalette.orangeDew),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                appPalette.brightRose),
                          ),
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => screen1()));
                            setState(() {
                              _index = _index+1;
                            });

                            if(_index==5){
                              Get.to(phone_number());
                            }
                          },
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  color: appPalette.brightRose).merge(FontStyles.text18),
                              children: [
                                TextSpan(text: content[_index]['button']),
                                WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                    child: Icon(Icons.arrow_forward, size: 24),
                                  ),
                                ),
                              ],
                            ),
                          )
                          //Text('TextButton' , style: TextStyle(color: appPalette.brightRose, fontSize: 18, decoration: TextDecoration.none)),
                          ),
                    ),
                  ]),
                ])));
  }
}
