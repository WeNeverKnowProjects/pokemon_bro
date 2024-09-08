import 'package:flutter/material.dart';

import 'general_button.dart';

class DefaultButton extends GeneralButton {
  DefaultButton({super.text = "SUBMIT", super.onPressed});
  @override
  Widget get child => ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 29, 29, 29)),
      onPressed: onPressed,
      child: Text(
        "$text",
        style: const TextStyle(
          color: Colors.white,
        ),
      ));
}
