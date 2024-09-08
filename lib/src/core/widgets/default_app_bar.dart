import 'package:flutter/material.dart';
import 'package:pokemon/src/core/widgets/texts/title_text.dart';

class DefaultAppBar {
  final String title;
  const DefaultAppBar({
    required this.title,
  });
  AppBar get child => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: TitleText(text: title).child,
      );
}
