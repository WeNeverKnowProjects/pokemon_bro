import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/enums/enums.dart';
import 'package:pokemon/src/core/log/logger.dart';
import 'package:pokemon/src/features/authentication/domain/entities/member.dart';
import 'package:pokemon/src/features/authentication/domain/usecase/login_with_email_usecase.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@lazySingleton
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginWithEmailUsecase) : super(const LoginState());
  final LoginWithEmailUsecase _loginWithEmailUsecase;

  login(String email, String password) async {
    // if (isClosed) return;
    emit(state.copyWith(
      state: LoadState.loading,
      errorMessage: null,
      member: null,
    ));
    final (fail, member) =
        await _loginWithEmailUsecase(LoginEmailParam(email, password));
    if (fail != null) {
      // if (isClosed) return;
      emit(state.copyWith(
        errorMessage: fail.message,
        state: LoadState.failed,
      ));
    } else {
      // if (isClosed) return;
      emit(state.copyWith(
        state: LoadState.success,
        member: member,
      ));
    }
  }
}
