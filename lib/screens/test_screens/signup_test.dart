import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milestone/recources/auth.dart';
import 'package:milestone/screens/test_screens/isiprofile_test.dart';
import 'package:milestone/utils/colors.dart';
import 'package:milestone/utils/fonts.dart';
import 'package:milestone/widgets/text_field.dart';
import 'package:milestone/recources/temp_auth.dart';

class SignupTestScreen extends StatefulWidget {
  const SignupTestScreen({Key? key}) : super(key: key);

  @override
  _SignupTestScreenState createState() => _SignupTestScreenState();
}

class _SignupTestScreenState extends State<SignupTestScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phonenumController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  bool isForgotPressed = false;
  bool isSignupPressed = false;

  @override
  void dispose() {
    super.dispose();
    //_emailController.dispose();
    _passwordController.dispose();
    _phonenumController.dispose();
    _fullnameController.dispose();
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
                    ////Bagian Atas

                    //Space yg bisa stretch biar lebih berisi dan bagian atas bisa adaptasi
                    const Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox(),
                    ),

                    //Welcome text
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Welcome!',
                        style: TextStyle(
                          fontFamily: baseFont1,
                          fontWeight: FontWeight.bold,
                          color: baseColor2,
                          fontSize: 30,
                        ),
                      ),
                    ),

                    //Space kosong
                    const SizedBox(height: 64),

                    //Password field

                    //Space kosong
                    const SizedBox(
                      height: 24,
                    ),

                    //Password field
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFieldInput(
                        hintText: "E-mail Address",
                        textInputType: TextInputType.emailAddress,
                        textEditingController: _emailController,
                      ),
                    ),

                    //Space kosong
                    const SizedBox(
                      height: 24,
                    ),

                    //Password field
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFieldInput(
                        hintText: "Password",
                        textInputType: TextInputType.text,
                        textEditingController: _passwordController,
                        isPass: true,
                      ),
                    ),

                    //Space kosong
                    const SizedBox(height: 55),

                    //Login Button
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
                        onPressed: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfileScreenTest()));
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

                    //Space kosong
                    const SizedBox(
                      height: 24,
                    ),

                    //Forget password button
                    GestureDetector(
                      onTapUp: (details) {
                        setState(() => isForgotPressed = !isForgotPressed);
                      },
                      onTapDown: (details) {
                        setState(() => isForgotPressed = !isForgotPressed);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Forgot Password",
                          style: TextStyle(
                            fontFamily: baseFont1,
                            fontWeight: FontWeight.bold,
                            color: isForgotPressed
                                ? Colors.white.withOpacity(0.5)
                                : baseColor1,
                          ),
                        ),
                      ),
                    ),

                    //Space pemisah antara bagian atas dengan bagian bawah biar lebih fit/padet
                    const Expanded(child: SizedBox()),
                  ],
                ),
              )))),
    );
  }
}
