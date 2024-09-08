part of 'login_cubit.dart';

@Freezed()
class LoginState with _$LoginState {
  const LoginState._();
  const factory LoginState({
    @Default(LoadState.initial) final LoadState state,
    final Member? member,
    final String? errorMessage,
  }) = _LoginState;

  bool get failed => state == LoadState.failed;
  bool get success => state == LoadState.success;
  bool get loading => state == LoadState.loading;
}
