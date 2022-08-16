import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milestone/recources/auth.dart';
import 'package:milestone/screens/RegisterScreen.dart';
import 'package:milestone/screens/chat_list.dart';
import 'package:milestone/utils/colors.dart';
import 'package:milestone/utils/fonts.dart';
import 'package:milestone/utils/utils.dart';
import 'package:milestone/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isForgotPressed = false;
  bool isSignupPressed = false;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await authFirebase().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == "Success") {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ChatListScreen()));
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      isLoading = false;
    });
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
                    const Flexible(
                      child: SizedBox(
                        height: 50,
                      ),
                      flex: 1,
                      fit: FlexFit.loose,
                    ),

                    //const SizedBox(height: 64),

                    //Username field
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFieldInput(
                        hintText: "Username",
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
                    const Flexible(
                      child: SizedBox(
                        height: 50,
                      ),
                      flex: 1,
                      fit: FlexFit.loose,
                    ),

                    //const SizedBox(height: 55),

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
                        onPressed: () {
                          loginUser;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChatListScreen()));
                        },
                        child: isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                    color: baseColor3))
                            : Text(
                                "LOG IN",
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
                    const Flexible(
                        child: SizedBox(), flex: 1, fit: FlexFit.tight),

                    //const Expanded(child: SizedBox()),

                    ////Bagian Bawah

                    //Divider garis
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
                      "Social Media Login",
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

                    // const SizedBox(
                    //   height: 5,
                    // ),

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
                          "Don't have an account? ",
                          style: TextStyle(
                              fontFamily: baseFont1,
                              fontWeight: FontWeight.bold,
                              color: baseColor1),
                        ),

                        //Sign Up Button
                        GestureDetector(
                          onTapUp: ((details) {
                            setState(() => isSignupPressed = !isSignupPressed);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                          }),
                          onTapDown: ((details) {
                            setState(() => isSignupPressed = !isSignupPressed);
                          }),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontFamily: baseFont1,
                                fontWeight: FontWeight.bold,
                                color: isSignupPressed
                                    ? Color.fromARGB(255, 214, 182, 21)
                                    : Color.fromARGB(255, 255, 219, 32)),
                          ),
                        )
                      ],
                    ),

                    //Space kosong
                    const Flexible(
                        child: SizedBox(), flex: 1, fit: FlexFit.loose)
                    // const SizedBox(
                    //   height: 20,
                    // )
                  ],
                ),
              )))),
    );
  }
}
