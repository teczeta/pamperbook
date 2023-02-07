import 'package:flutter/material.dart';

import '../constants.dart';

class TextFieldWithBorder extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
   bool isPassWord;
   TextInputType textInputType;
   TextFieldWithBorder( {
    Key? key,
     required this.hint,
     required this.textEditingController,
     this.isPassWord =false,
     this.textInputType = TextInputType.text

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
      obscureText: isPassWord,
      controller: textEditingController,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 0.2, color: textColorBlack), //<-- SEE HERE
        ), enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            width: 0.2, color: textColorBlack), //<-- SEE HERE
      ),
      ),
    );
  }
}
