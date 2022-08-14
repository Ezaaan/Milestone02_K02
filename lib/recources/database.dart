import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:milestone/utils/prefs.dart';

class DataFirebase {
  Future addUserInfoToDB(
    String uid, Map<String, dynamic> userInfoMap) async {
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

  createChatRoom(String chatRoomID, Map chatRoomInfoMap) async {
    final snapShot = await FirebaseFirestore.instance
    .collection("charooms")
    .doc(chatRoomID)
    .get();

    if(snapShot.exists){
      //chatroom already exist
      return true;
    }else{
      //chatroom does not exists
      return FirebaseFirestore.instance
      .collection("chatrooms")
      .doc(chatRoomID)
      .set(chatRoomInfoMap);
    }
  }

  Future<Stream<QuerySnapshot>> getChatRoomMessages(chatRoomID) async {
    return FirebaseFirestore.instance
      .collection("chatrooms")
      .doc(chatRoomID)
      .collection("chats")
      .orderBy("times", descending: true) // biar last message ada di atas, nanti di reverse
      .snapshots();
  }

  Future<Stream<QuerySnapshot>> getChatRooms() async {
    String myName = await SharedPref().getUserName();
    return FirebaseFirestore.instance
      .collection("chatrooms")
      .orderBy("lastMessageTime", descending: true)
      .where("users", arrayContains: myUsername)
      .snapshots();
  }
}
