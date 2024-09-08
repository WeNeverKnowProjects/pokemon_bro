import 'package:flutter/material.dart';
import 'package:pokemon/src/core/constants/constants.dart';

Widget buildLink(String title, String linkLabel, {Function()? onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(title),
      const SizedBox(
        width: defaultPadding / 2,
      ),
      InkWell(
        onTap: onTap,
        child: Text(
          linkLabel,
          style: const TextStyle(
            color: Colors.blue,
          ),
        ),
      )
    ],
  );
}

Widget buildField(String label, {Widget? child}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(label),
      const SizedBox(
        height: defaultPadding / 4,
      ),
      child ?? const SizedBox.shrink(),
    ],
  );
}
