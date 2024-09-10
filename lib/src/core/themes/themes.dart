import 'package:flutter/material.dart';

class AppTheme {
  final BuildContext context;
  final ThemeMode mode;
  AppTheme(this.context, this.mode) {
    _isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
  }

  bool _isDark = true;

  bool get darkMode => _isDark;

  ThemeData get themes => _isDark ? _darkTheme(context) : _lightTheme(context);

  ThemeData _lightTheme(BuildContext context) => ThemeData(
        primaryColor: const Color.fromARGB(255, 39, 34, 34),
        disabledColor: const Color.fromARGB(255, 130, 130, 130),
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Color.fromARGB(162, 255, 255, 255),
        ),
        useMaterial3: true,
        textTheme: Theme.of(context).textTheme.apply(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 39, 34, 34),
            disabledBackgroundColor: const Color.fromARGB(255, 201, 201, 201),
            foregroundColor: Colors.white,
            disabledForegroundColor: const Color.fromARGB(255, 233, 233, 233),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                side: const BorderSide(
                  color: Color.fromARGB(255, 39, 34, 34),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                textStyle: const TextStyle(color: Colors.black))),
      );

  ThemeData _darkTheme(BuildContext context) => ThemeData(
        primaryColor: const Color.fromARGB(255, 111, 5, 5),
        disabledColor: const Color.fromARGB(162, 156, 156, 156),
        useMaterial3: true,
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.white),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 240, 240, 240),
                side: const BorderSide(
                  color: Color.fromARGB(255, 214, 213, 213),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                textStyle: const TextStyle(
                    color: Color.fromARGB(255, 240, 240, 240)))),
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Color.fromARGB(138, 226, 157, 140),
          focusColor: Colors.white,
          prefixIconColor: Colors.white,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 111, 5, 5),
            disabledBackgroundColor: const Color.fromARGB(162, 156, 156, 156),
            foregroundColor: Colors.white,
            disabledForegroundColor: const Color.fromARGB(255, 153, 152, 152),
          ),
        ),
      );
}
