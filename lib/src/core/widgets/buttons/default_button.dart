import 'package:flutter/material.dart';

import 'general_button.dart';

class DefaultButton extends GeneralButton {
  DefaultButton({super.text = "SUBMIT", super.onPressed});
  @override
  Widget get child => ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 111, 5, 5),
        disabledBackgroundColor: const Color.fromARGB(162, 156, 156, 156),
      ),
      onPressed: onPressed,
      child: Text(
        "$text",
        style: TextStyle(
          color: onPressed == null
              ? const Color.fromARGB(255, 153, 152, 152)
              : Colors.white,
        ),
      ));
}
