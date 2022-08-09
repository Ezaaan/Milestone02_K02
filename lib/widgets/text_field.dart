import 'dart:ui';

import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      required this.hintText,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = UnderlineInputBorder(
        borderSide: BorderSide(
            color: Colors.grey.withOpacity(
                0.5))); //(borderSide: Divider.createBorderSide(context));
    return TextFormField(
      style: TextStyle(
          fontFamily: "Montserrat", color: Colors.grey.withOpacity(0.5)),
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Colors.grey.withOpacity(0.5)),
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        //filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
