import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milestone/utils/colors.dart';
import 'package:milestone/utils/fonts.dart';
import 'package:milestone/widgets/text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
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
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: baseFont1,
                              color: baseColor3,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        CircleAvatar(
                            radius: 30,
                            backgroundColor: baseColor2,
                            child: SvgPicture.asset(
                                "assets/icons/user_icon.svg",
                                color: Colors.white,
                                height: 40,
                            ),
                        ),
                        const SizedBox(
                            height: 10,
                        ),
                        Container(
                            color: baseColor1,
                            width: double.infinity,
                            height: 20,
                            alignment: Alignment.topCenter,
                            child: Text(
                                "Tekan untuk ubah ",
                                style: TextStyle(
                                    color: Colors.white, 
                                    fontFamily: baseFont1, 
                                    fontWeight: FontWeight.bold),
                            )
                        ),
                        const SizedBox(
                            height: 10,
                        ),
                        Row(
                            children: [
                                const SizedBox(
                                    width: 20,
                                    ),
                                Text(
                                    "Nama",
                                    style: TextStyle(
                                        fontFamily: baseFont1, 
                                        color: baseColor3, 
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                    "Siapa",
                                    style: TextStyle(
                                        fontFamily: baseFont1, 
                                        color: baseColor3, 
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                ),
                                IconButton(
                                    onPressed: (){}, 
                                    icon: Icon(
                                        Icons.arrow_forward_ios_outlined, 
                                        color: baseColor1,
                                    ))
                            ]
                        ),

                        Divider(
                            height: 10, 
                            thickness: 1, 
                            color: baseColor1,
                        ),

                        Row(
                            children: [
                                const SizedBox(
                                    width: 20,
                                    ),
                                Text(
                                    "Username",
                                    style: TextStyle(
                                        fontFamily: baseFont1, 
                                        color: baseColor3, 
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                    "Siapa",
                                    style: TextStyle(
                                        fontFamily: baseFont1, 
                                        color: baseColor3, 
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                ),
                                IconButton(
                                    onPressed: (){}, 
                                    icon: Icon(
                                        Icons.arrow_forward_ios_outlined, 
                                        color: baseColor1,
                                    ))
                            ]
                        ),

                        Divider(
                            height: 10, 
                            thickness: 1, 
                            color: baseColor1,
                        ),    

                        Row(
                            children: [
                                const SizedBox(
                                    width: 20,
                                    ),
                                Text(
                                    "Bio",
                                    style: TextStyle(
                                        fontFamily: baseFont1, 
                                        color: baseColor3, 
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                    "Atur",
                                    style: TextStyle(
                                        fontFamily: baseFont1, 
                                        color: baseColor1, 
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                ),
                                IconButton(
                                    onPressed: (){}, 
                                    icon: Icon(
                                        Icons.arrow_forward_ios_outlined, 
                                        color: baseColor1,
                                    ))
                            ]
                        ),

                        const SizedBox(height: 40),

                        Divider(
                            height: 10, 
                            thickness: 50, 
                            color: baseColor1,
                        ),                    

                        Row(
                            children: [
                                const SizedBox(
                                    width: 20,
                                    ),
                                Text(
                                    "Jenis Kelamin",
                                    style: TextStyle(
                                        fontFamily: baseFont1, 
                                        color: baseColor3, 
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                    "Atur",
                                    style: TextStyle(
                                        fontFamily: baseFont1, 
                                        color: baseColor1, 
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                ),
                                IconButton(
                                    onPressed: (){}, 
                                    icon: Icon(
                                        Icons.arrow_forward_ios_outlined, 
                                        color: baseColor1,
                                    ))
                            ]
                        ),

                        Divider(
                            height: 10, 
                            thickness: 1, 
                            color: baseColor1,
                        ),

                        Row(
                            children: [
                                const SizedBox(
                                    width: 20,
                                    ),
                                Text(
                                    "Tanggal Lahir",
                                    style: TextStyle(
                                        fontFamily: baseFont1, 
                                        color: baseColor3, 
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                    "Atur",
                                    style: TextStyle(
                                        fontFamily: baseFont1, 
                                        color: baseColor1, 
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                ),
                                IconButton(
                                    onPressed: (){}, 
                                    icon: Icon(
                                        Icons.arrow_forward_ios_outlined, 
                                        color: baseColor1,
                                    ))
                            ]
                        ),

                        Divider(
                            height: 10, 
                            thickness: 1, 
                            color: baseColor1,
                        ),

                        Row(
                            children: [
                                const SizedBox(
                                    width: 20,
                                    ),
                                Text(
                                    "Email",
                                    style: TextStyle(
                                        fontFamily: baseFont1, 
                                        color: baseColor3, 
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                    "Atur",
                                    style: TextStyle(
                                        fontFamily: baseFont1, 
                                        color: baseColor1, 
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                ),
                                IconButton(
                                    onPressed: (){}, 
                                    icon: Icon(
                                        Icons.arrow_forward_ios_outlined, 
                                        color: baseColor1,
                                    ))
                            ]
                        ),

                        Divider(
                            height: 10, 
                            thickness: 1, 
                            color: baseColor1,
                        ),

                        Row(
                            children: [
                                const SizedBox(
                                    width: 20,
                                    ),
                                Text(
                                    "Ubah Password",
                                    style: TextStyle(
                                        fontFamily: baseFont1, 
                                        color: baseColor3, 
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                    "Atur",
                                    style: TextStyle(
                                        fontFamily: baseFont1, 
                                        color: baseColor1, 
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                ),
                                IconButton(
                                    onPressed: (){}, 
                                    icon: Icon(
                                        Icons.arrow_forward_ios_outlined, 
                                        color: baseColor1,
                                    ))
                            ]
                        ),

                        Divider(
                            height: 10, 
                            thickness: 1, 
                            color: baseColor1,
                        ),
                        
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
                                    onPressed: () {},
                                    icon: Icon(
                                        Icons.search_outlined,
                                        color: Colors.white,
                                        size: 40,
                                    ))),
                          ],
                        ),
                        //const SizedBox(width: 30),
                        
                        //Tab Message
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

                        // Tab User
                        Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: baseColor2,
                              radius: 24,
                            ),
                            Positioned(
                                left: -2,
                                top: -4,
                                child: IconButton(
                                    onPressed: () {},
                                    iconSize: 35,
                                    icon: SvgPicture.asset(
                                        "assets/icons/user_icon.svg",
                                        color: Colors.white,
                                        height: 40)),
                            ),
                          ],
                        ),

                        // Tab Settings
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
