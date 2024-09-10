import 'dart:ui';

import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
    required this.assetImage,
    this.blurColor,
  });
  final String assetImage;
  final Color? blurColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetImage),
          fit: BoxFit.cover,
        ),
      ),
      // child: const SizedBox.shrink(),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 1),
        child: Container(
          decoration: BoxDecoration(color: blurColor),
        ),
      ),
    );
  }
}
