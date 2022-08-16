import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milestone/screens/chatWindow_screen.dart';
import 'package:milestone/screens/findFriend_screen.dart';
import 'package:milestone/screens/profile_screen.dart';
import 'package:milestone/screens/settings_screen.dart';
import 'package:milestone/utils/colors.dart';
import 'package:milestone/utils/fonts.dart';
import 'package:milestone/widgets/text_field.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
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
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Chats',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: baseFont1,
                                color: baseColor3,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                            height: 30,
                            child: TextFormField(
                              style: TextStyle(
                                  fontFamily: baseFont1,
                                  color: Colors.white,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                filled: true,
                                fillColor: baseColor1,
                                focusColor: baseColor1,
                                hoverColor: baseColor1,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: baseColor1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: baseColor1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: baseColor1,
                                  ),
                                ),
                                hintText: "Search",
                                hintStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: baseFont1),
                              ),
                              keyboardType: TextInputType.text,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    child: Divider(
                      color: baseColor1,
                      thickness: 1,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChatWindowScreen()));
                    },
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: baseColor2,
                          child: SvgPicture.asset(
                            "assets/icons/user_icon.svg",
                            color: Colors.white,
                            height: 40,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              "Nama",
                              style: TextStyle(
                                  fontFamily: baseFont1,
                                  color: baseColor3,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Messages",
                              style: TextStyle(
                                  fontFamily: baseFont1,
                                  color: baseColor1,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "Time",
                            style: TextStyle(
                                fontFamily: baseFont1, color: baseColor1),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
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
                              backgroundColor: baseColor3,
                              radius: 24,
                            ),
                            Positioned(
                                left: -4,
                                top: -4,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FindFriendScreen()));
                                    },
                                    icon: Icon(
                                      Icons.search_outlined,
                                      color: Colors.white,
                                      size: 40,
                                    ))),
                          ],
                        ),
                        const Flexible(
                          child: SizedBox(),
                          flex: 1,
                          fit: FlexFit.tight,
                        ),
                        Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: baseColor2,
                              radius: 24,
                            ),
                            Positioned(
                                left: -4,
                                top: 4,
                                child: IconButton(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.message_outlined,
                                      color: Colors.white,
                                      size: 40,
                                    ))),
                          ],
                        ),
                        const Flexible(
                          child: SizedBox(),
                          flex: 1,
                          fit: FlexFit.tight,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProfileScreen()));
                            },
                            iconSize: 40,
                            icon: SvgPicture.asset("assets/icons/user_icon.svg",
                                color: Colors.white, height: 40)),
                        const Flexible(
                          child: SizedBox(),
                          flex: 1,
                          fit: FlexFit.loose,
                        ),
                        IconButton(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SettingsScreen()));
                            },
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
