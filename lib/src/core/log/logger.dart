import 'package:flutter/foundation.dart';

class Logger {
  static void d(String message) {
    if (kDebugMode) {
      print("INFO => $message");
    }
  }

  static void e(String message) {
    if (kDebugMode) {
      print("ERROR => $message");
    }
  }
}
