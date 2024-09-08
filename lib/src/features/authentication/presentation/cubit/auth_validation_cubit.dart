import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon/src/features/authentication/presentation/validation/login_validation.dart';
import 'package:pokemon/src/features/authentication/presentation/validation/sign_up_validation.dart';

part 'auth_validation_state.dart';
part 'auth_validation_cubit.freezed.dart';

class AuthValidationCubit extends Cubit<AuthValidationState> {
  AuthValidationCubit() : super(const AuthValidationState());

  validateLogin({String? email, String? password}) {
    emit(state.copyWith(
        loginValidation: LoginValidation(
            email ?? state.loginValidation?.email ?? "",
            password ?? state.loginValidation?.password ?? "")));
  }

  validateLoginFormat({String? email, String? password}) {
    emit(state.copyWith(
        loginFormatValidation: LoginFormatValidation(
      email ?? state.loginValidation?.email ?? "",
      password ?? state.loginValidation?.password ?? "",
    )));
  }

  validateSignUp({String? email, String? password, String? confirmPassword}) {
    emit(
      state.copyWith(
        signUpValidation: SignUpValidation(
            email ?? state.signUpValidation?.email ?? "",
            password ?? state.signUpValidation?.password ?? "",
            confirmPassword ?? state.signUpValidation?.confirmPassword ?? ""),
      ),
    );
  }

  validateSignUpFormat(
      {String? email, String? password, String? confirmPassword}) {
    emit(
      state.copyWith(
        signUpFormatValidation: SignUpFormatValidation(
          email ?? state.signUpFormatValidation?.email ?? "",
          password ?? state.signUpFormatValidation?.password ?? "",
          confirmPassword ??
              state.signUpFormatValidation?.confirmPassword ??
              "",
        ),
      ),
    );
  }
}
