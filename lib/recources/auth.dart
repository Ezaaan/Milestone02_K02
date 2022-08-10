import 'dart:typed_data';
import 'package:milestone/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class authFirebase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> SignUp({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "An error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
