part of 'signup_cubit.dart';

@Freezed()
class SignupState with _$SignupState {
  const SignupState._();
  const factory SignupState([
    @Default(LoadState.initial) final LoadState state,
    final Member? member,
    final String? errorMessage,
  ]) = _SignupState;

  bool get failed => state == LoadState.failed;
  bool get success => state == LoadState.success;
  bool get loading => state == LoadState.loading;
}
