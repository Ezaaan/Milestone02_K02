import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:milestone/utils/colors.dart';
import 'package:milestone/utils/fonts.dart';

class SenderMessageCard extends StatelessWidget {
  const SenderMessageCard({
    Key? key,
    required this.message,
    required this.date,
  }) : super(key: key);
  final String message;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Row(children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: baseColor2,
            backgroundImage: const NetworkImage(
                'https://img.icons8.com/pastel-glyph/64/000000/gender-neutral-user.png'),
          ),
          Bubble(
            alignment: Alignment.topLeft,
            margin: const BubbleEdges.only(top: 10),
            nip: BubbleNip.leftTop,
            color: baseColor1,
            child: Text(
              message,
              textAlign: TextAlign.left,
              style: TextStyle(fontFamily: baseFont1, color: baseColor4),
            ),
          ),
          Text(
            date,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: baseFont1,
              color: baseColor1,
              fontSize: 5,
            ),
          ),
          const Expanded(child: SizedBox()),
        ]),
      ),
    );
  }
}
