import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milestone/recources/temp_auth.dart';
import 'package:milestone/screens/IsiProfile_screen.dart';
import 'package:milestone/screens/login_screen.dart';
import 'package:milestone/utils/colors.dart';
import 'package:milestone/utils/fonts.dart';
import 'package:milestone/widgets/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isSigninPressed = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
                  ///Bagian Atas
                  ///Space yg bisa stretch
                  const Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: SizedBox(),
                  ),

                  //Welcome text
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Create a new account',
                      style: TextStyle(
                        fontFamily: baseFont1,
                        fontWeight: FontWeight.bold,
                        color: baseColor2,
                        fontSize: 30,
                      ),
                    ),
                  ),

                  //Space kosong
                  const Flexible(
                    child: SizedBox(
                      height: 50,
                    ),
                    flex: 1,
                    fit: FlexFit.loose,
                  ),

                  //email field
                  TextFormField(
                    controller: _emailController,
                    style: TextStyle(
                        fontFamily: baseFont1, color: baseColor2, fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                      filled: false,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          width: 3,
                          color: baseColor2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          width: 3,
                          color: baseColor2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          width: 3,
                          color: baseColor2,
                        ),
                      ),
                      focusColor: baseColor2,
                      iconColor: baseColor2,
                      hoverColor: baseColor2,
                      hintText: "E-mail Address",
                      hintStyle: TextStyle(
                          fontSize: 16,
                          color: baseColor2,
                          fontFamily: baseFont1,
                          fontWeight: FontWeight.bold),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  //Space kosong
                  const SizedBox(
                    height: 24,
                  ),

                  //password field
                  TextFormField(
                    controller: _passwordController,
                    style: TextStyle(
                        fontFamily: baseFont1, color: baseColor2, fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                      filled: false,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          width: 3,
                          color: baseColor2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          width: 3,
                          color: baseColor2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          width: 3,
                          color: baseColor2,
                        ),
                      ),
                      focusColor: baseColor2,
                      iconColor: baseColor2,
                      hoverColor: baseColor2,
                      hintText: "Password",
                      hintStyle: TextStyle(
                          fontSize: 16,
                          color: baseColor2,
                          fontFamily: baseFont1,
                          fontWeight: FontWeight.bold),
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),

                  const Flexible(
                    child: SizedBox(),
                    flex: 1,
                    fit: FlexFit.tight,
                  ),

                  //Sign up button
                  ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(22),
                                      side: BorderSide(color: baseColor2))),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(baseColor2),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 100))),
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => IsiProfileScreen()));
                        String res = await tempAuthFirebase().SignUp(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        //phoneNum: _phonenumController.text);
                        print(res);
                      },
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                            fontFamily: baseFont1,
                            color: baseColor3,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),

                  //Space pemisah antara bagian atas dengan
                  //bagian bawah biar lebih fit/padet
                  const Flexible(
                      child: SizedBox(), flex: 1, fit: FlexFit.tight),

                  Row(
                    children: <Widget>[
                      //Divider kiri
                      Expanded(
                          child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 20),
                        child: Divider(
                          color: baseColor1,
                          height: 50,
                          thickness: 1,
                        ),
                      )),
                      //or
                      Text(
                        "or",
                        style: TextStyle(
                            fontFamily: baseFont1,
                            color: baseColor1,
                            fontWeight: FontWeight.bold),
                      ),
                      //Divider kanan
                      Expanded(
                          child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 10),
                        child: Divider(
                          color: baseColor1,
                          height: 50,
                          thickness: 1,
                        ),
                      ))
                    ],
                  ),

                  //Teks Social Login
                  Text(
                    "Social Media Signup",
                    style: TextStyle(
                        fontFamily: baseFont1,
                        color: baseColor1,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),

                  //Space kosong
                  const Flexible(
                    child: SizedBox(),
                    flex: 1,
                    fit: FlexFit.tight,
                  ),
                  //Icon-icon social media
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Icon Google
                      Container(
                          alignment: Alignment.center,
                          height: 120,
                          width: 100,
                          child: GestureDetector(
                            onTap: () {
                              //print("GOOGLE"); //Nanti bawa ke sign in google
                            },
                            child: SvgPicture.asset(
                              "assets/icons/google_logo.svg",
                              height: 60,
                            ),
                          )),

                      //Icon Fb
                      Container(
                          alignment: Alignment.center,
                          height: 100,
                          width: 100,
                          child: GestureDetector(
                            onTap: () {
                              //print("FACEBOOK");   //Nanti bawa ke sign in facebook
                            },
                            child: SvgPicture.asset(
                              "assets/icons/fb_logo.svg",
                              height: 75,
                            ),
                          )),

                      //Icon apple
                      Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 100,
                        child: GestureDetector(
                          onTap: () {
                            //print("APPLE"); //Nanti bawa ke sign in apple
                          },
                          child: SvgPicture.asset(
                            "assets/icons/apple_logo.svg",
                            height: 70,
                          ),
                        ),
                      )
                    ],
                  ),

                  //Space kosong
                  const SizedBox(
                    height: 10,
                  ),

                  //Sign up text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Don't have account text
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                            fontFamily: baseFont1,
                            fontWeight: FontWeight.bold,
                            color: baseColor1),
                      ),

                      //Sign Up Button
                      GestureDetector(
                        onTapUp: ((details) {
                          setState(() => isSigninPressed = !isSigninPressed);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                        }),
                        onTapDown: ((details) {
                          setState(() => isSigninPressed = !isSigninPressed);
                        }),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontFamily: baseFont1,
                              fontWeight: FontWeight.bold,
                              color: isSigninPressed
                                  ? Color.fromARGB(255, 214, 182, 21)
                                  : Color.fromARGB(255, 255, 219, 32)),
                        ),
                      )
                    ],
                  ),

                  //Space kosong
                  const Flexible(child: SizedBox(), flex: 1, fit: FlexFit.loose)
                ],
              ),
            ),
          )),
    ));
  }
}
