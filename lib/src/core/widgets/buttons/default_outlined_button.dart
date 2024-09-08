import 'general_button.dart';
import 'package:flutter/material.dart';

class DefaultOutlinedButton extends GeneralButton {
  DefaultOutlinedButton({super.text = "SUBMIT", super.onPressed});
  @override
  Widget get child => OutlinedButton(
      style: OutlinedButton.styleFrom(
        // foregroundColor: const Color.fromARGB(255, 131, 130, 133),
        side: const BorderSide(
          color: Color.fromARGB(255, 214, 213, 213),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      onPressed: onPressed,
      child: Text(
        text!,
        style: const TextStyle(color: Color.fromARGB(255, 28, 27, 28)),
      ));
}
