abstract class Exceptions implements Exception {}

class ValidationException implements Exceptions {
  final String message;
  ValidationException(this.message);
}

class FirebaseAuthenticationException implements Exceptions {
  final String message;
  FirebaseAuthenticationException(this.message);
}

class FirestoreException implements Exceptions {
  final String message;
  FirestoreException(this.message);
}

class FetchException implements Exception {
  final String message;
  final int statusCode;
  FetchException(this.message, {this.statusCode = 200});
}

class UnsupportedFormatException implements Exception {
  final String message;
  UnsupportedFormatException(this.message);
}

class UnknownException implements Exception {
  final String message;
  UnknownException(this.message);
}
