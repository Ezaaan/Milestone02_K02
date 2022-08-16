import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:milestone/model/temp_user.dart' as model;
import 'package:milestone/model/user.dart' as model;
import 'package:milestone/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:milestone/utils/prefs.dart';
import 'package:milestone/recources/storage_methods.dart';

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
        SharedPref()
            .saveUserName(userDetails.email!.replaceAll("@gmail.com", ""));
        SharedPref().saveDisplayName(userDetails.displayName);
      }
    }
  }

  Future<String> ProfileSignUp({
    required String email,
    required String fullName,
    required String phoneNum,
    required String nickName,
    required String gender,
    required String age,
    required String job,
    required String city,
    required String uid,
    required Uint8List file,

    //required String bio,
    //required Uint8List file,
  }) async {
    String res = "An error occured";
    try {
      if (email.isNotEmpty ||
          fullName.isNotEmpty ||
          phoneNum.isNotEmpty ||
          nickName.isNotEmpty ||
          gender.isNotEmpty ||
          age.isNotEmpty ||
          job.isNotEmpty ||
          city.isNotEmpty ||
          uid.isNotEmpty ||
          file != null) {
        // UserCredential cred = await auth.createUserWithEmailAndPassword(
        //     email: email, password: password);

        String photoUrl =
            await StorageMethods().uploadImageToStorage('profilePics', file);

        model.User user = model.User(
            email: email,
            fullName: fullName,
            phoneNum: phoneNum,
            uid: uid,
            nickName: nickName,
            gender: gender,
            age: age,
            job: job,
            city: city,
            photoUrl: photoUrl);

        await _firestore.collection('users').doc(uid).set(user.toJson());
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Some error occured";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        res = "Success";
      } else {
        res = "Please enter all the field";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> signOut() async{
    await _auth.signOut();
  }
}
