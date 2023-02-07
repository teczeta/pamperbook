
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onButtonClicked;
  final String buttonText;
   double fontSize;
   CustomElevatedButton({
    Key? key,
    required this.onButtonClicked,
    required this.buttonText,
     this.fontSize = 15,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          onSurface: textColorBlack,
          primary: textColorBlack,
          textStyle: TextStyle(fontSize: fontSize),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
          )

      ),
      onPressed: () {
        onButtonClicked();
      },
      child: Text(buttonText),
    );
  }
}