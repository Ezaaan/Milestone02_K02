import 'package:cloud_firestore/cloud_firestore.dart';

class DataFirebase {
  addUserInfoToDB(String uid, Map<String, dynamic> userInfoMap) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getUserByUsername(String username) async {
    return FirebaseFirestore.instance
        .collection("users")
        .where("username", isEqualTo: username)
        .snapshots();
  }

  Future addMessage(String chatRoomID, String messageID,
      Map<String, dynamic> messageInfoMap) async {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomID)
        .collection("chats")
        .doc(messageID)
        .set(messageInfoMap);
  }

  updateLastMessageSend(
      String chatRoomID, Map<String, dynamic> lastMessageInfoMap) {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomID)
        .update(lastMessageInfoMap);
  }
}
