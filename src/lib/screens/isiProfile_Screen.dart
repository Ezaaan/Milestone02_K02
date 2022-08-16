import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milestone/recources/auth.dart';
import 'package:milestone/screens/chat_list.dart';
import 'package:milestone/screens/interest_screen.dart';
import 'package:milestone/utils/colors.dart';
import 'package:milestone/utils/fonts.dart';
import 'package:milestone/utils/utils.dart';
import 'package:milestone/widgets/text_field.dart';

class IsiProfileScreen extends StatefulWidget {
  const IsiProfileScreen({Key? key}) : super(key: key);

  @override
  _IsiProfileScreenState createState() => _IsiProfileScreenState();
}

class _IsiProfileScreenState extends State<IsiProfileScreen> {
  List<String> gender = ['Jenis kelamin', 'Laki-laki', 'Perempuan'];
  String selectedItem = 'Jenis kelamin';

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

                    const SizedBox(
                      height: 5,
                    ),

                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Please complete your profile',
                        style: TextStyle(
                          fontFamily: baseFont1,
                          fontWeight: FontWeight.bold,
                          color: baseColor1,
                          fontSize: 17,
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
                    //Nama lengkap
                    TextFormField(
                      style: TextStyle(
                          fontFamily: baseFont1,
                          color: baseColor1,
                          fontSize: 16),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        filled: false,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: baseColor1,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: baseColor1,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: baseColor1,
                          ),
                        ),
                        hintText: "Nama Lengkap",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: baseColor1,
                            fontFamily: baseFont1,
                            fontWeight: FontWeight.bold),
                      ),
                      keyboardType: TextInputType.text,
                    ),

                    //Space kosong
                    const Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox(),
                    ),

                    //Nama panggilan
                    TextFormField(
                      style: TextStyle(
                          fontFamily: baseFont1,
                          color: baseColor1,
                          fontSize: 16),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        filled: false,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: baseColor1,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: baseColor1,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: baseColor1,
                          ),
                        ),
                        hintText: "Nama Panggilan",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: baseColor1,
                            fontFamily: baseFont1,
                            fontWeight: FontWeight.bold),
                      ),
                      keyboardType: TextInputType.text,
                    ),

                    //Space kosong
                    const Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox(),
                    ),
                    //Username field

                    //Nomor telepon
                    TextFormField(
                      style: TextStyle(
                          fontFamily: baseFont1,
                          color: baseColor1,
                          fontSize: 16),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        filled: false,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: baseColor1,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: baseColor1,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: baseColor1,
                          ),
                        ),
                        hintText: "Nomor telepon",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: baseColor1,
                            fontFamily: baseFont1,
                            fontWeight: FontWeight.bold),
                      ),
                      keyboardType: TextInputType.text,
                    ),

                    //Space kosong
                    const Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox(),
                    ),

                    //jenis kelamin
                    Align(
                      alignment: Alignment.topLeft,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        dropdownColor: baseColor4,
                        alignment: Alignment.topLeft,
                        value: selectedItem,
                        icon: const Icon(Icons.arrow_drop_down_outlined),
                        elevation: 16,
                        style: TextStyle(
                            color: baseColor1,
                            fontFamily: baseFont1,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        underline: Container(
                          alignment: Alignment.topLeft,
                          width: double.infinity,
                          height: 1,
                          color: baseColor1,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedItem = newValue!;
                          });
                        },
                        items: <String>[
                          'Jenis kelamin',
                          'Laki-laki',
                          'Perempuan'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),

                    //Umur
                    TextFormField(
                      style: TextStyle(
                          fontFamily: baseFont1,
                          color: baseColor1,
                          fontSize: 16),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        filled: false,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: baseColor1,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: baseColor1,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: baseColor1,
                          ),
                        ),
                        hintText: "Umur",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: baseColor1,
                            fontFamily: baseFont1,
                            fontWeight: FontWeight.bold),
                      ),
                      keyboardType: TextInputType.text,
                    ),

                    //Space kosong
                    const Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox(),
                    ),
                    //Username field

                    //Pekerjaan
                    TextFormField(
                      style: TextStyle(
                          fontFamily: baseFont1,
                          color: baseColor1,
                          fontSize: 16),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        filled: false,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: baseColor1,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: baseColor1,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: baseColor1,
                          ),
                        ),
                        hintText: "Pekerjaan",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: baseColor1,
                            fontFamily: baseFont1,
                            fontWeight: FontWeight.bold),
                      ),
                      keyboardType: TextInputType.text,
                    ),

                    //Space kosong
                    const Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox(),
                    ),

                    //Kota tempat tinggal
                    TextFormField(
                      style: TextStyle(
                          fontFamily: baseFont1,
                          color: baseColor1,
                          fontSize: 16),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        filled: false,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: baseColor1,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: baseColor1,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: baseColor1,
                          ),
                        ),
                        hintText: "Kota tempat tinggal",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: baseColor1,
                            fontFamily: baseFont1,
                            fontWeight: FontWeight.bold),
                      ),
                      keyboardType: TextInputType.text,
                    ),

                    const SizedBox(
                      height: 80,
                    ),

                    Container(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => InterestScreen()));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.white,
                            size: 40,
                          )),
                    ),

                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              )))),
    );
  }
}
