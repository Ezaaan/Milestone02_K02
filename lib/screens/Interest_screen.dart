import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milestone/recources/auth.dart';
import 'package:milestone/screens/RegisterScreen.dart';
import 'package:milestone/screens/chat_list.dart';
import 'package:milestone/utils/colors.dart';
import 'package:milestone/utils/fonts.dart';
import 'package:milestone/utils/utils.dart';
import 'package:milestone/widgets/text_field.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({Key? key}) : super(key: key);

  @override
  _InterestScreenState createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    //Info ttg dimensi device

    // Full screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Height (without SafeArea)
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - padding.bottom;

    // Height (without status bar)
    double height2 = height - padding.top;

    // Height (without status and toolbar)
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
                height: height2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ////Bagian Atas

                    //Welcome text
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Welcome to Pencari Sahabat!',
                        style: TextStyle(
                          fontFamily: baseFont1,
                          fontWeight: FontWeight.bold,
                          color: baseColor2,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Pick your interest",
                        style: TextStyle(
                            fontFamily: baseFont1,
                            color: baseColor1,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Row(
                                  children: [
                                    Text(
                                      "Design",
                                      style: TextStyle(
                                          fontFamily: baseFont1,
                                          color: baseColor3,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(child: SizedBox()),
                                    IconButton(
                                        onPressed: () {
                                          isPressed = !isPressed;
                                        },
                                        icon: Icon(Icons.check,
                                            color: isPressed
                                                ? baseColor1
                                                : baseColor2))
                                  ],
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Row(
                                  children: [
                                    Text(
                                      "Fashion",
                                      style: TextStyle(
                                          fontFamily: baseFont1,
                                          color: baseColor3,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(child: SizedBox()),
                                    IconButton(
                                        onPressed: () {
                                          isPressed = !isPressed;
                                        },
                                        icon: Icon(Icons.check,
                                            color: isPressed
                                                ? baseColor1
                                                : baseColor2))
                                  ],
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Row(
                                  children: [
                                    Text(
                                      "Movies",
                                      style: TextStyle(
                                          fontFamily: baseFont1,
                                          color: baseColor3,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(child: SizedBox()),
                                    IconButton(
                                        onPressed: () {
                                          isPressed = !isPressed;
                                        },
                                        icon: Icon(Icons.check,
                                            color: isPressed
                                                ? baseColor1
                                                : baseColor2))
                                  ],
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Row(
                                  children: [
                                    Text(
                                      "Books",
                                      style: TextStyle(
                                          fontFamily: baseFont1,
                                          color: baseColor3,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(child: SizedBox()),
                                    IconButton(
                                        onPressed: () {
                                          isPressed = !isPressed;
                                        },
                                        icon: Icon(Icons.check,
                                            color: isPressed
                                                ? baseColor1
                                                : baseColor2))
                                  ],
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Row(
                                  children: [
                                    Text(
                                      "Education",
                                      style: TextStyle(
                                          fontFamily: baseFont1,
                                          color: baseColor3,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(child: SizedBox()),
                                    IconButton(
                                        onPressed: () {
                                          isPressed = !isPressed;
                                        },
                                        icon: Icon(Icons.check,
                                            color: isPressed
                                                ? baseColor1
                                                : baseColor2))
                                  ],
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Row(
                                  children: [
                                    Text(
                                      "Travel",
                                      style: TextStyle(
                                          fontFamily: baseFont1,
                                          color: baseColor3,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(child: SizedBox()),
                                    IconButton(
                                        onPressed: () {
                                          isPressed = !isPressed;
                                        },
                                        icon: Icon(Icons.check,
                                            color: isPressed
                                                ? baseColor1
                                                : baseColor2))
                                  ],
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: 160,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Row(children: [
                                Text(
                                  "Technology",
                                  style: TextStyle(
                                      fontFamily: baseFont1,
                                      color: baseColor3,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(child: SizedBox()),
                                IconButton(
                                    onPressed: () {
                                      isPressed = !isPressed;
                                    },
                                    icon: Icon(Icons.check,
                                        color: isPressed
                                            ? baseColor1
                                            : baseColor2))
                              ]),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),

                        //ROW KEDUA
                        Column(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Row(
                                  children: [
                                    Text(
                                      "Cooking",
                                      style: TextStyle(
                                          fontFamily: baseFont1,
                                          color: baseColor3,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(child: SizedBox()),
                                    IconButton(
                                        onPressed: () {
                                          isPressed = !isPressed;
                                        },
                                        icon: Icon(Icons.check,
                                            color: isPressed
                                                ? baseColor1
                                                : baseColor2))
                                  ],
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Row(
                                  children: [
                                    Text(
                                      "Animals",
                                      style: TextStyle(
                                          fontFamily: baseFont1,
                                          color: baseColor3,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(child: SizedBox()),
                                    IconButton(
                                        onPressed: () {
                                          isPressed = !isPressed;
                                        },
                                        icon: Icon(Icons.check,
                                            color: isPressed
                                                ? baseColor1
                                                : baseColor2))
                                  ],
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Row(
                                  children: [
                                    Text(
                                      "Vehicles",
                                      style: TextStyle(
                                          fontFamily: baseFont1,
                                          color: baseColor3,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(child: SizedBox()),
                                    IconButton(
                                        onPressed: () {
                                          isPressed = !isPressed;
                                        },
                                        icon: Icon(Icons.check,
                                            color: isPressed
                                                ? baseColor1
                                                : baseColor2))
                                  ],
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Row(
                                  children: [
                                    Text(
                                      "Foods",
                                      style: TextStyle(
                                          fontFamily: baseFont1,
                                          color: baseColor3,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(child: SizedBox()),
                                    IconButton(
                                        onPressed: () {
                                          isPressed = !isPressed;
                                        },
                                        icon: Icon(Icons.check,
                                            color: isPressed
                                                ? baseColor1
                                                : baseColor2))
                                  ],
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Row(
                                  children: [
                                    Text(
                                      "Sports",
                                      style: TextStyle(
                                          fontFamily: baseFont1,
                                          color: baseColor3,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(child: SizedBox()),
                                    IconButton(
                                        onPressed: () {
                                          isPressed = !isPressed;
                                        },
                                        icon: Icon(Icons.check,
                                            color: isPressed
                                                ? baseColor1
                                                : baseColor2))
                                  ],
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Row(
                                  children: [
                                    Text(
                                      "Video Games",
                                      style: TextStyle(
                                          fontFamily: baseFont1,
                                          color: baseColor3,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(child: SizedBox()),
                                    IconButton(
                                        onPressed: () {
                                          isPressed = !isPressed;
                                        },
                                        icon: Icon(Icons.check,
                                            color: isPressed
                                                ? baseColor1
                                                : baseColor2))
                                  ],
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: 160,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Row(children: [
                                Text(
                                  "Electronics",
                                  style: TextStyle(
                                      fontFamily: baseFont1,
                                      color: baseColor3,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(child: SizedBox()),
                                IconButton(
                                    onPressed: () {
                                      isPressed = !isPressed;
                                    },
                                    icon: Icon(Icons.check,
                                        color: isPressed
                                            ? baseColor1
                                            : baseColor2))
                              ]),
                            )
                          ],
                        )
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.white,
                              size: 40,
                            )),
                        Expanded(child: SizedBox()),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChatListScreen()));
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white,
                              size: 40,
                            ))
                      ],
                    ),
                    SizedBox(height: 10)
                  ],
                ),
              )))),
    );
  }
}
