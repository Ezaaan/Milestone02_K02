import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:milestone/responsive/mobileScreenLayout.dart';
import 'package:milestone/responsive/responsive_layouts.dart';
import 'package:milestone/responsive/webScreenLayout.dart';
import 'package:milestone/screens/HomeScreen.dart';
import 'package:milestone/screens/RegisterScreen.dart';
import 'package:milestone/screens/settings_screen.dart';
import 'package:milestone/screens/chatWindow_screen.dart';
import 'package:milestone/screens/chat_list.dart';
import 'package:milestone/screens/findFriend_screen.dart';
import 'package:milestone/screens/login_screen.dart';
import 'package:milestone/screens/profile_screen.dart';

import 'package:milestone/screens/test_screens/signup_test.dart';
import 'package:milestone/utils/colors.dart';

import 'screens/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCXzOJ9sZDDZ_rSiXvaXSuVzHH6YLHMW3Y",
        appId: "1:601197916139:web:5fd81bf96b9c74826eb3ae",
        messagingSenderId: "601197916139",
        projectId: "aplikasi-pencari-teman",
        storageBucket: "aplikasi-pencari-teman.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pencari Teman',
      theme: ThemeData(),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),

      //Kalau mau ngerun dan liat hasil screen bisa diganti disini
      home: FutureBuilder(
        future: authFirebase().getCurrentUser(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
