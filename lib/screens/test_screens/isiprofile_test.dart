import 'dart:html';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milestone/recources/auth.dart';
import 'package:milestone/utils/colors.dart';
import 'package:milestone/utils/fonts.dart';
import 'package:milestone/utils/prefs.dart';
import 'package:milestone/utils/utils.dart';
import 'package:milestone/widgets/text_field.dart';
import 'package:milestone/recources/temp_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phonenumController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  //final docRef =
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  bool isForgotPressed = false;
  bool isSignupPressed = false;
  String email = "";
  String password = "";
  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    //getEmail();
    //getPassword();
    //getPhone();
    // //deleteTemp();
  }

  // getEmail() async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('tempUsers')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();

  //   //print(snap.data());
  //   setState(() {
  //     email = (snap.data() as Map<String, dynamic>)['email'].toString();
  //     while (email.runtimeType == Null) {
  //       email = (snap.data() as Map<String, dynamic>)['email'].toString();
  //     }
  //   });
  //   print('$email');
  // }

  // getPassword() async {
  //   //var currentuser;
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('tempUsers')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();

  //   setState(() {
  //     password = (snap.data() as Map<String, dynamic>)['password'].toString();
  //     while (password.runtimeType == Null) {
  //       password = (snap.data() as Map<String, dynamic>)['password'].toString();
  //     }
  //   });
  // }

  // getPhone() async {
  //   //var currentuser;
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('tempUsers')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();

  //   setState(() {
  //     phone = (snap.data() as Map<String, dynamic>)['phoneNum'].toString();
  //     while (phone.runtimeType == Null) {
  //       phone = (snap.data() as Map<String, dynamic>)['phoneNum'].toString();
  //     }
  //   });
  // }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phonenumController.dispose();
    _fullnameController.dispose();
    _nicknameController.dispose();
    _genderController.dispose();
    _ageController.dispose();
    _jobController.dispose();
    _cityController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
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

                    // Gambar PP
                    Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(_image!),
                              )
                            : const CircleAvatar(
                                radius: 64,
                                backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1615038552039-e1b271f14ec8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
                              ),
                        Positioned(
                            bottom: -10,
                            left: 80,
                            child: IconButton(
                              onPressed: selectImage,
                              icon: const Icon(
                                Icons.add_a_photo,
                              ),
                            ))
                      ],
                    ),

                    //Space kosong
                    const SizedBox(height: 64),

                    //Username field
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFieldInput(
                        hintText: "Nama Lengkap",
                        textInputType: TextInputType.name,
                        textEditingController: _fullnameController,
                      ),
                    ),

                    //Password field
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFieldInput(
                        hintText: "Nama Panggilan",
                        textInputType: TextInputType.name,
                        textEditingController: _nicknameController,
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFieldInput(
                        hintText: "Nomor Telepon",
                        textInputType: TextInputType.phone,
                        textEditingController: _phonenumController,
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
                        hintText: "Jenis Kelamin",
                        textInputType: TextInputType.text,
                        textEditingController: _genderController,
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
                        hintText: "Umur",
                        textInputType: TextInputType.number,
                        textEditingController: _ageController,
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFieldInput(
                        hintText: "Pekerjaan",
                        textInputType: TextInputType.text,
                        textEditingController: _jobController,
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFieldInput(
                        hintText: "City",
                        textInputType: TextInputType.text,
                        textEditingController: _cityController,
                      ),
                    ),

                    //Space kosong
                    const Expanded(child: SizedBox()),

                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        IconButton(
                            onPressed: () async {
                              //phone = getPhone().toString();
                              //print('$email');
                              // print(email);
                              String res = await authFirebase().ProfileSignUp(
                                  email: FirebaseAuth
                                      .instance.currentUser!.email
                                      .toString(),
                                  fullName: _fullnameController.text,
                                  phoneNum: _phonenumController.text,
                                  nickName: _nicknameController.text,
                                  gender: _genderController.text,
                                  age: _ageController.text,
                                  job: _jobController.text,
                                  city: _cityController.text,
                                  uid: FirebaseAuth.instance.currentUser!.uid);
                              // var delete = await FirebaseFirestore.instance
                              //     .collection('tempUsers')
                              //     .doc(FirebaseAuth.instance.currentUser!.uid)
                              //     .delete();
                              print(res);
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 30,
                            ))
                      ],
                    ),

                    //Space kosong
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              )))),
    );
  }
}
