part of 'auth_validation_cubit.dart';

@freezed
class AuthValidationState with _$AuthValidationState {
  const AuthValidationState._();
  const factory AuthValidationState({
    final LoginValidation? loginValidation,
    final LoginFormatValidation? loginFormatValidation,
    final SignUpValidation? signUpValidation,
    final SignUpFormatValidation? signUpFormatValidation,
  }) = _AuthValidationState;
}
