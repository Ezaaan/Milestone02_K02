import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:milestone/recources/database.dart';
import 'package:milestone/utils/colors.dart';
import 'package:milestone/utils/fonts.dart';
import 'package:milestone/utils/prefs.dart';
import 'package:milestone/widgets/chat_list.dart';
import 'package:random_string/random_string.dart';

class ChatWindowScreen extends StatefulWidget {
  //const ChatWindowScreen({Key? key}) : super(key: key);
  final String chatWithUsername, name;
  ChatWindowScreen(
      {Key? key, required this.chatWithUsername, required this.name})
      : super(key: key);
  // String chatRoomID, messageID = "";
  // String myName, myProfilePic, myEmail;
  // final TextInputType textInputType;
  // const _ChatWindowScreenState(
  //     {Key? key,
  //     required this.textInputType})
  //     : super(key: key);

  @override
  _ChatWindowScreenState createState() => _ChatWindowScreenState();
}

class _ChatWindowScreenState extends State<ChatWindowScreen> {
  // String chatRoomID, messageID = "";
  // String myName, myProfile, myUsername, myEmail;
  late String chatRoomID, messageID = "";
  late String myName, myProfilePic, myEmail, theReciever;
  final TextEditingController messageEditingController =
      TextEditingController();
  final messageBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.white));

  getMyInfoFromSharedPref() async {
    myName = (await SharedPref().getNickName())!;
    myEmail = (await SharedPref().getEmail())!;

    chatRoomID = getChatRoomIDByUsernames(widget.chatWithUsername, myName);
  }

  getChatRoomIDByUsernames(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  addMessage(bool sendClicked) {
    if (messageEditingController.text != "") {
      String message = messageEditingController.text;
      var messageTime = DateTime.now();

      Map<String, dynamic> messageInfoMap = {
        "message": message,
        "sender": myName,
        "time": messageTime,
        "imgUrl": myProfilePic
      };

      if (messageID == "") {
        messageID = randomAlphaNumeric(10);
      }

      DataFirebase()
          .addMessage(chatRoomID, messageID, messageInfoMap)
          .then((value) {
        Map<String, dynamic> lastMessageInfoMap = {
          "lastMessage": message,
          "lastMessageTime": messageTime,
          "lastMessageSender": myName,
        };

        DataFirebase().updateLastMessageSend(chatRoomID, lastMessageInfoMap);

        if (sendClicked) {
          //remove the text in the message input field
          messageEditingController.text = "";

          //make message id blank
          messageID = "";
        }
      });
    }
  }

  getAndSetMessages() async {}

  onLaunch() async {
    await getMyInfoFromSharedPref();
    getAndSetMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            baseColor3,
            baseColor4,
          ],
        )),
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top + 15),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 30,
                    )),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Name',
                  style: TextStyle(
                      fontFamily: baseFont1,
                      color: baseColor2,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(
              color: Colors.white,
              height: 20,
            ),
            // Bubble(
            //   alignment: Alignment.topLeft,
            //   margin: const BubbleEdges.only(top: 10),
            //   nip: BubbleNip.leftTop,
            //   color: baseColor1,
            //   child: Text(
            //     test,
            //     textAlign: TextAlign.left,
            //     style: TextStyle(fontFamily: baseFont1, color: baseColor4),
            //   ),
            // ),
            // const Expanded(child: SizedBox()),

            Expanded(
                child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
              child: Container(
                //width: 10,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: ChatList(),
              ),
            )),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 32),
              height: 70,
              width: double.infinity,
              color: baseColor2,
              child: TextFormField(
                style: TextStyle(fontFamily: baseFont1, color: baseColor3),
                controller: messageEditingController,
                decoration: InputDecoration(
                    border: messageBorder,
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                    focusedBorder: messageBorder,
                    enabledBorder: messageBorder),
                //keyboardType: ,
              ),
            )
          ],
        ),
      ),
    );
  }
}
