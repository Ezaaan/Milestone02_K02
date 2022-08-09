import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milestone/utils/colors.dart';
import 'package:milestone/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Color ColorFont1 = Colors.grey.withOpacity(0.5);
  String Font1 = "Montserrat";
  bool isPressed = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  const Color.fromARGB(255, 1, 45, 82),
                  Colors.black.withOpacity(0.9),
                ],
              )),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
              width: double.infinity,
              child: SingleChildScrollView(
                  child: Container(
                padding: MediaQuery.of(context).padding,
                height: height3,
                // height: MediaQuery.of(context).size.height -
                //     MediaQuery.of(context).padding.top -
                //     kToolbarHeight -
                //     MediaQuery.of(context).padding.bottom,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(),
                      flex: 1,
                      fit: FlexFit.tight,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Welcome!',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                          //height: 1,
                          fontSize: 30,
                        ),
                      ),
                    ),

                    // Flexible(
                    //   child: Container(),
                    //   flex: 1,
                    // ),

                    // SvgPicture.asset(
                    //   "assets/logo_itb.svg",
                    //   color: primaryColor,
                    //   height: 150,
                    // ),

                    const SizedBox(height: 64),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFieldInput(
                        hintText: "Username",
                        textInputType: TextInputType.emailAddress,
                        textEditingController: _emailController,
                      ),
                    ),

                    const SizedBox(
                      height: 24,
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFieldInput(
                        hintText: "Password",
                        textInputType: TextInputType.text,
                        textEditingController: _passwordController,
                        isPass: true,
                      ),
                    ),

                    const SizedBox(height: 55),

                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22),
                                    side: const BorderSide(
                                        color: Color.fromARGB(
                                            255, 255, 219, 32)))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 255, 219, 32)),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 100))),
                        onPressed: () {},
                        child: const Text(
                          "LOG IN",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromARGB(255, 1, 45, 82),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),

                    const SizedBox(
                      height: 24,
                    ),

                    GestureDetector(
                      onTapUp: (details) {
                        setState(() => isPressed = true);
                      },
                      onTapDown: (details) {
                        setState(() => isPressed = false);
                      },
                      child: RichText(
                        text: TextSpan(
                          // recognizer: TapGestureRecognizer()
                          //   ..onTapUp = () => print(isPressed),
                          text: "Forgot Password",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color: isPressed
                                ? Colors.grey.withOpacity(0.5)
                                : Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),

                    Expanded(child: SizedBox()),

                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.only(left: 10, right: 20),
                          child: Divider(
                            color: Colors.grey.withOpacity(0.5),
                            height: 80,
                            thickness: 1,
                          ),
                        )),
                        Text(
                          "or",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: Colors.grey.withOpacity(0.5),
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.only(left: 20, right: 10),
                          child: Divider(
                            color: Colors.grey.withOpacity(0.5),
                            height: 80,
                            thickness: 1,
                          ),
                        ))
                      ],
                    ),

                    //Expanded(child: SizedBox()),

                    Text(
                      "Social Media Login",
                      style: TextStyle(
                          fontFamily: Font1,
                          color: ColorFont1,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),

                    SizedBox(
                      height: 5,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          //Icon google
                          alignment: Alignment.center,
                          height: 120,
                          width: 100,
                          child: SvgPicture.asset(
                            "assets/icons/google_logo.svg",
                            height: 60,
                          ),
                        ),
                        Container(
                          //Icon Fb
                          alignment: Alignment.center,
                          height: 100,
                          width: 100,
                          child: SvgPicture.asset(
                            "assets/icons/fb_logo.svg",
                            height: 75,
                          ),
                        ),
                        Container(
                          //Icon apple
                          alignment: Alignment.center,
                          height: 100,
                          width: 100,
                          child: SvgPicture.asset(
                            "assets/icons/apple_logo.svg",
                            height: 70,
                          ),
                        )
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                              fontFamily: Font1,
                              color: ColorFont1,
                              fontWeight: FontWeight.bold),
                          children: const <TextSpan>[
                            TextSpan(
                              text: "Sign Up",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Color.fromARGB(255, 255, 219, 32)),
                            )
                          ]),
                    )
                  ],
                ),
              )))),
    );
  }
}
