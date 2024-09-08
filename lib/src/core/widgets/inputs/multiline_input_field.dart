import 'package:flutter/material.dart';
import 'package:pokemon/src/core/widgets/inputs/general_input_field.dart';

import '../../constants/constants.dart';

class MultilineInputField extends GeneralInputField {
  MultilineInputField({
    TextEditingController? controller,
    String? labelText,
    Widget? prefixIcon,
    bool? obscureText,
    Widget? suffixIcon,
    String? hintText,
    this.errorText,
    this.maxLines = 5,
    this.color,
  }) {
    this.controller = controller;
    this.labelText = labelText;
    this.prefixIcon = prefixIcon;
    this.obscureText = obscureText;
    this.suffixIcon = suffixIcon;
    this.hintText = hintText;
  }
  final String? errorText;
  final int? maxLines;
  final Color? color;

  @override
  // TODO: implement child
  Widget get child => TextField(
        controller: controller,
        obscureText: obscureText ?? false,
        minLines: 1,
        maxLines: maxLines,
        decoration: InputDecoration(
          errorText: errorText,
          errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: color ?? secondaryColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: color ?? secondaryColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: color ?? secondaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: color ?? secondaryColor)),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: labelText,
          floatingLabelStyle: TextStyle(color: color ?? secondaryColor),
          hintText: hintText,
        ),
      );
}
