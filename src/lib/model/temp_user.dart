import 'package:cloud_firestore/cloud_firestore.dart';

class tempUser {
  final String email;
  final String uid;
  //final String phoneNum;
  //final String password;

  const tempUser({
    required this.email,
    required this.uid,
  });
  //required this.phoneNum,
  //required this.password});

  // static tempUser fromSnap(DocumentSnapshot snap) {
  //   var snapshot = snap.data() as Map<String, dynamic>;

  //   return tempUser(
  //       email: snapshot["email"],
  //       uid: snapshot["uid"],
  //       phoneNum: snapshot["phoneNum"],
  //       password: snapshot["password"]);
  // }

  Map<String, dynamic> toJson() => {"uid": uid, "email": email};
}
