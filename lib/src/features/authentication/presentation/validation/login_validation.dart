import 'package:pokemon/src/core/validator/string_validator.dart';

class LoginFormatValidation {
  final String email;
  final String password;
  LoginFormatValidation(this.email, this.password);

  StringValidator emailFormat = EmailFormatValidation();
  StringValidator passwordLength = PasswrodMatchLength();

  bool get emailFormatValid => emailFormat.isValid(email);
  bool get passwordLengthValid => passwordLength.isValid(password);
}

class LoginValidation {
  final String email;
  final String password;
  LoginValidation(this.email, this.password);

  StringValidator emailEmpty = NonEmptyStrinValidation();
  StringValidator passwordEmpty = NonEmptyStrinValidation();

  bool get emailEmptyValid => emailEmpty.isValid(email);
  bool get passwordEmptyValid => passwordEmpty.isValid(password);

  bool get isFormValid => emailEmptyValid && passwordEmptyValid;
}
