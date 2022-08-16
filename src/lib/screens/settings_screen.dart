import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milestone/screens/chat_list.dart';
import 'package:milestone/screens/findFriend_screen.dart';
import 'package:milestone/screens/profile_screen.dart';
import 'package:milestone/utils/colors.dart';
import 'package:milestone/utils/fonts.dart';
import 'package:milestone/utils/prefs.dart';
import 'package:milestone/widgets/text_field.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  String? FullName;

  bool isForgotPressed = false;
  bool isSignupPressed = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _searchController.dispose();
  }

  @override
  void initState() {
    super.initState();
    myFullname();
  }

  Future<String?> myFullname() async {
    FullName = await SharedPref().getFullName();
  }

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
              //padding: const EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              child: SingleChildScrollView(
                  child: Container(
                height: height2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            CircleAvatar(
                              backgroundColor: baseColor2,
                              radius: 30,
                            ),
                            Positioned(
                                left: 9,
                                top: 7,
                                child: IconButton(
                                    //padding: EdgeInsets.symmetric(horizontal: 70),
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      "assets/icons/user_icon.svg",
                                      color: Colors.white,
                                      height: 60,
                                    ))),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Nama Lengkap",
                              style: TextStyle(
                                fontFamily: baseFont1,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                                //height: 2,
                              ),
                            ),
                            Divider(
                              color: Colors.white,
                              thickness: 3,
                              //height: 20,
                            ),
                            Text(
                              'Username',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: baseFont1,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Divider(
                            color: Colors.white,
                            height: 20,
                          ),
                        ]),

                    //Space kosong
                    const SizedBox(height: 20),

                    //Search field

                    //Space kosong
                    const SizedBox(
                      height: 24,
                    ),

                    //Space kosong
                    const SizedBox(height: 0),

                    //chat Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20, left: 20),
                          child: Text(
                            'Account',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: baseFont1,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        //Space kosong
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20, left: 20),
                          child: Text(
                            'Notifications',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: baseFont1,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        //Space kosong
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20, left: 20),
                          child: Text(
                            'Privacy',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: baseFont1,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        //Space kosong
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20, left: 20),
                          child: Text(
                            'Security',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: baseFont1,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        //Space kosong
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20, left: 20),
                          child: Text(
                            'Help',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: baseFont1,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        //Space kosong
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20, left: 20),
                          child: Text(
                            'About',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: baseFont1,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        //Space kosong
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: 1, left: 20, top: 40),
                          child: Text(
                            'Log out <username>',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: baseFont1,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 33, 129, 226),
                              fontSize: 15,
                            ),
                          ),
                        ),
                        //Space kosong
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    //Space pemisah antara bagian atas dengan bagian bawah biar lebih fit/padet
                    const Expanded(child: SizedBox()),

                    ////Bagian Bawah

                    //Divider garis
                    Row(
                      children: <Widget>[
                        //Divider kiri
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.only(),
                          child: Divider(
                            color: baseColor1,
                            height: 20,
                            thickness: 2,
                          ),
                        )),
                      ],
                    ),

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
                          //const SizedBox(width: 30),
                          IconButton(
                              padding: EdgeInsets.symmetric(horizontal: 70),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ChatListScreen()));
                              },
                              icon: Icon(
                                Icons.message_outlined,
                                color: Colors.white,
                                size: 40,
                              )),
                          //
                          //const SizedBox(width: 10),

                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProfileScreen()));
                              },
                              iconSize: 40,
                              icon: SvgPicture.asset(
                                  "assets/icons/user_icon.svg",
                                  color: Colors.white,
                                  height: 40)),

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
                ),
              )))),
    );
  }
}
