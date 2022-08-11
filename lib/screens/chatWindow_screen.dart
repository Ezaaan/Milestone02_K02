import 'package:flutter/material.dart';
import 'package:milestone/utils/colors.dart';
import 'package:milestone/utils/fonts.dart';
import 'package:milestone/widgets/chat_list.dart';

class ChatWindowScreen extends StatefulWidget {
  const ChatWindowScreen({Key? key}) : super(key: key);
  // final String ChatUsername, name;
  // ChatWindowScreen(this.ChatUsername, this.name);
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
  final TextEditingController textEditingController = TextEditingController();
  final messageBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.white));

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
            const Expanded(child: ChatList()),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 32),
              height: 70,
              width: double.infinity,
              color: baseColor2,
              child: TextFormField(
                style: TextStyle(fontFamily: baseFont1, color: baseColor3),
                controller: textEditingController,
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
