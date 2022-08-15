import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milestone/utils/colors.dart';
import 'package:milestone/utils/fonts.dart';
import 'package:milestone/widgets/text_field.dart';

apakek

class FindFriendScreen extends StatefulWidget {
  const FindFriendScreen({Key? key}) : super(key: key);

  @override
  _FindFriendScreenState createState() => _FindFriendScreenState();
}

class _FindFriendScreenState extends State<FindFriendScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isForgotPressed = false;
  bool isSignupPressed = false;

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
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Find Friends',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: baseFont1,
                              color: baseColor3,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: baseColor1),
                              height: 350,
                              width: 350,
                              child: SvgPicture.asset('assets/icons/avatar.svg',
                                  height: 50, color: baseColor1),
                            ),
                            Positioned(
                                bottom: -50,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.yellow.withOpacity(0.7),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 10),
                                  height: 150,
                                  width: 350,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nama Panggilan, Umur',
                                        style: TextStyle(
                                            fontFamily: baseFont1,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Bio',
                                        style: TextStyle(
                                          fontFamily: baseFont1,
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In nibh lacus, finibus quis interdum placerat, ullamcorper aliquam erat',
                                        style: TextStyle(
                                          fontFamily: baseFont1,
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
                    height: 70,
                    width: double.infinity,
                    color: baseColor3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: baseColor2,
                              radius: 24,
                            ),
                            Positioned(
                                left: -4,
                                top: -4,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.search_outlined,
                                      color: Colors.white,
                                      size: 40,
                                    ))),
                          ],
                        ),
                        //const SizedBox(width: 30),
                        IconButton(
                            padding: EdgeInsets.symmetric(horizontal: 70),
                            onPressed: () {},
                            icon: Icon(
                              Icons.message_outlined,
                              color: Colors.white,
                              size: 40,
                            )),
                        //
                        //const SizedBox(width: 10),

                        IconButton(
                            onPressed: () {},
                            iconSize: 40,
                            icon: SvgPicture.asset("assets/icons/user_icon.svg",
                                color: Colors.white, height: 40)),

                        IconButton(
                            padding: EdgeInsets.symmetric(horizontal: 70),
                            onPressed: () {},
                            icon: Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 40,
                            ))
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
