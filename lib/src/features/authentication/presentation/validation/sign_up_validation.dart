import 'package:pokemon/src/core/messages/messages.dart';
import 'package:pokemon/src/core/validator/string_validator.dart';

class SignUpValidation {
  final String email;
  final String password;
  final String confirmPassword;
  SignUpValidation(this.email, this.password, this.confirmPassword);

  StringValidator emailEmpty = NonEmptyStrinValidation();
  StringValidator passwordEmpty = NonEmptyStrinValidation();
  StringValidator confirmPasswordEmpty = NonEmptyStrinValidation();

  bool get isFormValid =>
      emailEmpty.isValid(email) &&
      passwordEmpty.isValid(password) &&
      confirmPasswordEmpty.isValid(confirmPassword);
}

class SignUpFormatValidation {
  final String email;
  final String password;
  final String confirmPassword;
  SignUpFormatValidation(this.email, this.password, this.confirmPassword);

  bool get emailFormatValid => EmailFormatValidation().isValid(email);
  bool get passwordLengthValid => PasswrodMatchLength().isValid(password);
  bool get confirmPasswordLengthValid =>
      PasswrodMatchLength().isValid(confirmPassword);

  bool get passwordMatchValid =>
      MatchPasswordValidation(password).isValid(confirmPassword);

  String? get confirmPasswordError => !confirmPasswordLengthValid
      ? errorPasswordLength
      : (!passwordMatchValid ? errorPasswordUnMatch : null);

  bool get isFormValid =>
      emailFormatValid &&
      passwordLengthValid &&
      confirmPasswordLengthValid &&
      passwordMatchValid;
}
