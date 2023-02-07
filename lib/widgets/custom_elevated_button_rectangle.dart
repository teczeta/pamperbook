
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomElevatedButtonRectangle extends StatelessWidget {
  final VoidCallback onButtonClicked;
  final String buttonText;

  const CustomElevatedButtonRectangle({
    Key? key,
    required this.onButtonClicked,
    required this.buttonText,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          onSurface: textColorBlack,
          primary: textColorBlack,

      ),
      onPressed: () {
        onButtonClicked();
      },
      child: Text(buttonText),
    );
  }
}