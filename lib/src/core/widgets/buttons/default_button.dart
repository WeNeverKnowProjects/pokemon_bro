import 'package:flutter/material.dart';

import 'general_button.dart';

class DefaultButton extends GeneralButton {
  DefaultButton({super.text = "SUBMIT", super.onPressed});
  @override
  Widget get child => ElevatedButton(
      onPressed: onPressed,
      child: Text(
        "$text",
        // style: TextStyle(
        //   color: onPressed == null
        //       ? const Color.fromARGB(255, 153, 152, 152)
        //       : Colors.white,
        // ),
      ));
}
