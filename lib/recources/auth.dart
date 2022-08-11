import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:milestone/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:milestone/utils/prefs.dart';

class authFirebase {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  getCurrentUser() {
    return auth.currentUser;
  }

  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      User? userDetails = userCredential.user;

      if (userCredential != null) {
        SharedPref().saveEmail(userDetails!.email);
        SharedPref().saveUserID(userDetails.uid);
        SharedPref().saveDisplayName(userDetails.displayName);
      }
    }
  }

  Future<String> SignUp({
    required String email,
    required String password,
    required String fullName,
    required String phoneNum,
    //required String bio,
    //required Uint8List file,
  }) async {
    String res = "An error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          fullName.isNotEmpty ||
          phoneNum.isNotEmpty) {
        UserCredential cred = await auth.createUserWithEmailAndPassword(
            email: email, password: password);

        await _firestore.collection('users').doc(cred.user!.uid).set({
          'fullName': fullName,
          'uid': cred.user!.uid,
          'email': email,
          'phoneNum': phoneNum,
        });
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
