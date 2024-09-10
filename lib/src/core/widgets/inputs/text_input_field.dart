import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokemon/src/core/constants/constants.dart';

import 'general_input_field.dart';

class TextInputField extends GeneralInputField {
  TextInputField({
    TextEditingController? controller,
    String? labelText,
    Widget? prefixIcon,
    bool? obscureText,
    Widget? suffixIcon,
    String? hintText,
    this.color,
    this.errorText,
    this.inputType,
    this.readOnly = false,
    this.onChanged,
    this.textStyle,
    this.textAlign,
    this.onSubmitted,
    this.inputFormatters,
  }) {
    this.controller = controller;
    this.labelText = labelText;
    this.prefixIcon = prefixIcon;
    this.obscureText = obscureText;
    this.suffixIcon = suffixIcon;
    this.hintText = hintText;
  }

  final String? errorText;
  final TextInputType? inputType;
  final Color? color;
  final bool? readOnly;
  final Function(String)? onChanged;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget get child => TextField(
        onChanged: onChanged,
        keyboardType: inputType,
        controller: controller,
        readOnly: readOnly!,
        obscureText: obscureText ?? false,
        style: textStyle,
        onSubmitted: onSubmitted,
        inputFormatters: inputFormatters,
        textAlign: textAlign ?? TextAlign.start,
        decoration: InputDecoration(
          filled: true,
          errorText: errorText,
          errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 0.4,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 0.4,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: dangerColor,
                width: 0.4,
              )),
          focusedErrorBorder: const OutlineInputBorder(
              // borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
            width: 0.4,
          )),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: labelText,
          floatingLabelStyle: TextStyle(color: color ?? secondaryColor),
          hintText: hintText,
        ),
      );
}
