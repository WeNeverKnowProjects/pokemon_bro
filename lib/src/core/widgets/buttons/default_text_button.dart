import 'package:flutter/material.dart';

import 'package:pokemon/src/core/widgets/buttons/general_button.dart';

class DefaultTextButton extends GeneralButton {
  DefaultTextButton({super.text = "SUBMIT", super.onPressed});

  @override
  Widget get child => TextButton(
      style: TextButton.styleFrom(
          side: const BorderSide(
        color: Colors.deepPurple,
        width: 0.8,
      )),
      onPressed: onPressed,
      child: Text("$text"));
}
