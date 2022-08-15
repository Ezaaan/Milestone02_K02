import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milestone/screens/RegisterScreen.dart';
import 'package:milestone/screens/login_screen.dart';
import 'package:milestone/screens/test_screens/signup_test.dart';
import 'package:milestone/utils/colors.dart';
import 'package:milestone/utils/fonts.dart';
import 'package:milestone/widgets/text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - padding.bottom;

    double height2 = height - padding.top;
    double height3 = height - padding.top - kToolbarHeight;

    return Scaffold(
      body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  baseColor3,
                  baseColor4,
                ],
              )),
              padding: const EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              child: SingleChildScrollView(
                  child: Container(
                height: height1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ////Bagian Atas

                    //Space yg bisa stretch biar lebih berisi dan bagian atas bisa adaptasi
                    const Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox(),
                    ),
                    //Welcome text
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Aplikasi Pencari Sahabat',
                        style: TextStyle(
                          fontFamily: baseFont1,
                          fontWeight: FontWeight.bold,
                          color: baseColor2,
                          fontSize: 20,
                        ),
                      ),
                    ),

                    //Space kosong
                    const Flexible(
                      child: SizedBox(
                        height: 60,
                      ),
                      flex: 1,
                      fit: FlexFit.loose,
                    ),

                    //Button
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22),
                                    side: BorderSide(color: baseColor2))),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(baseColor2),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 100))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                        },
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                              fontFamily: baseFont1,
                              color: baseColor3,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                    //Login Button
                    //Space kosong
                    const Flexible(
                      child: SizedBox(
                        height: 30,
                      ),
                      flex: 1,
                      fit: FlexFit.loose,
                    ),

                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22),
                                    side: BorderSide(color: baseColor2))),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(baseColor3),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 100))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          "LOG IN",
                          style: TextStyle(
                              fontFamily: baseFont1,
                              color: baseColor2,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              )))),
    );
  }
}
