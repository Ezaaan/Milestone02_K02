import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String fullName;
  final String nickName;
  final String phoneNum;
  final String gender;
  final String age;
  final String job;
  final String city;
  final String photoUrl;

  const User(
      {required this.email,
      required this.uid,
      required this.fullName,
      required this.nickName,
      required this.phoneNum,
      required this.gender,
      required this.age,
      required this.job,
      required this.city,
      required this.photoUrl});

  // static User fromSnap(DocumentSnapshot snap) {
  //   var snapshot = snap.data() as Map<String, dynamic>;

  //   return User(
  //       fullName: snapshot['fullName'],
  //       nickName: snapshot['nickName'],
  //       email: snapshot["email"],
  //       uid: snapshot["uid"],
  //       phoneNum: snapshot["phoneNum"],
  //       gender: snapshot["gender"],
  //       age: snapshot['age'],
  //       job: snapshot['job'],
  //       city: snapshot['city']);
  // }

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "uid": uid,
        "email": email,
        "nickName": nickName,
        "phoneNum": phoneNum,
        "gender": gender,
        "age": age,
        "job": job,
        "city": city,
        'photoUrl': photoUrl,
      };
}
