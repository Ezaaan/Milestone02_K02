import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milestone/utils/colors.dart';
import 'package:milestone/utils/fonts.dart';
import 'package:milestone/widgets/text_field.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
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
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Chats',
                        style: TextStyle(
                          fontFamily: baseFont1,
                          fontWeight: FontWeight.bold,
                          color: baseColor2,
                          fontSize: 30,
                        ),
                      ),
                    ),

                    //Space kosong
                    const SizedBox(height: 20),

                    //Search field
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: TextFieldInput(
                        hintText: "Search",
                        textInputType: TextInputType.text,
                        textEditingController: _searchController,
                      ),
                    ),

                    //Space kosong
                    const SizedBox(
                      height: 24,
                    ),

                    //Space kosong
                    const SizedBox(height: 0),

                    //chat Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<CircleBorder>(
                                    CircleBorder(
                                        side: BorderSide(color: baseColor2))),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        baseColor2),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.all(14))),
                            onPressed: () {},
                            child: SvgPicture.asset(
                                "assets/icons/person_logo.svg",
                                height: 26,
                                width: 20),
                          ),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(color: baseColor2))),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        baseColor2),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 100))),
                            onPressed: () {},
                            child: Text(
                              "Name",
                              style: TextStyle(
                                  fontFamily: baseFont1,
                                  color: baseColor3,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    //Space kosong
                    const SizedBox(
                      height: 15,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<CircleBorder>(
                                    CircleBorder(
                                        side: BorderSide(color: baseColor2))),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        baseColor2),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.all(14))),
                            onPressed: () {},
                            child: SvgPicture.asset(
                                "assets/icons/person_logo.svg",
                                height: 26,
                                width: 20),
                          ),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(color: baseColor2))),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        baseColor2),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 100))),
                            onPressed: () {},
                            child: Text(
                              "Name",
                              style: TextStyle(
                                  fontFamily: baseFont1,
                                  color: baseColor3,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    //Space kosong
                    const SizedBox(
                      height: 24,
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

                    //Icon-icon social media
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Icon Google
                        Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 50,
                            child: GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                  "assets/icons/search_logo.svg",
                                  height: 50,
                                  width: 15),
                            )),

                        Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 100,
                            child: GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                  "assets/icons/chat_logo.svg",
                                  height: 50,
                                  width: 15),
                            )),

                        //Icon Fb
                        Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 50,
                            child: GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                "assets/icons/person_logo.svg",
                                height: 65,
                                width: 15,
                              ),
                            )),

                        //Icon apple
                        Container(
                          alignment: Alignment.center,
                          height: 100,
                          width: 90,
                          child: GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              "assets/icons/gear_logo.svg",
                              height: 55,
                              width: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )))),
    );
  }
}
