import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milestone/recources/temp_auth.dart';
import 'package:milestone/screens/login_screen.dart';
import 'package:milestone/screens/test_screens/isiprofile_test.dart';
import 'package:milestone/utils/colors.dart';
import 'package:milestone/utils/fonts.dart';
import 'package:milestone/widgets/text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailController = TextEditingController();
  String title;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
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

                  const Flexible(
                    child: SizedBox(),
                    flex: 1,
                    fit: FlexFit.tight,
                  ),

                  //Reset password button
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
                            builder: (context) => ProfileScreenTest()));
                        String res = await tempAuthFirebase().ResetPassword(
                          email: _emailController.text,
                        );
                        //phoneNum: _phonenumController.text);
                        print(res);
                      },
                      child: Text(
                        "RESET PASSWORD",
                        style: TextStyle(
                            fontFamily: baseFont1,
                            color: baseColor3,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                      firebaseButton(context, "Reset Password"), (){
                        FirebaseAuth.instance
                          .sendPasswordResetEmail(email: _emailController.text)
                          .then(value) => Navigator.of(context).pop();
                      }
                  //Space kosong
                  const Flexible(child: SizedBox(), flex: 1, fit: FlexFit.loose)
                ],
              ),
            ),
          )),
    ));
  }
}
