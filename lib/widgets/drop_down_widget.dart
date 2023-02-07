import 'package:flutter/material.dart';

import '../constants.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration:
      BoxDecoration(border: Border.all(color: textColorUnknown)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(
            'Select Customer',
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: textColorUnknown,
          )
        ],
      ),
    );
  }
}

