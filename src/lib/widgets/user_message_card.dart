import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:milestone/utils/colors.dart';
import 'package:milestone/utils/fonts.dart';

class UserMessageCard extends StatelessWidget {
  final String message;
  final String date;

  const UserMessageCard({Key? key, required this.message, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Row(children: [
          const Expanded(child: SizedBox()),
          Text(
            date,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontFamily: baseFont1,
              color: baseColor2,
              fontSize: 5,
            ),
          ),
          Bubble(
            alignment: Alignment.topRight,
            margin: BubbleEdges.only(top: 15),
            nip: BubbleNip.rightTop,
            color: baseColor2,
            child: Text(
              message,
              textAlign: TextAlign.right,
              style: TextStyle(fontFamily: baseFont1, color: baseColor4),
            ),
          ),
        ]),
      ),
    );
  }
}
