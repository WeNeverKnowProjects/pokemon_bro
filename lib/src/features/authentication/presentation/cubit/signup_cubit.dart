import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/enums/enums.dart';
import 'package:pokemon/src/features/authentication/domain/entities/member.dart';
import 'package:pokemon/src/features/authentication/domain/usecase/sign_up_usecase.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

@lazySingleton
class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._signUpUsecase) : super(const SignupState());
  final SignUpUsecase _signUpUsecase;

  createAccount(String email, String password) async {
    emit(state.copyWith(
      state: LoadState.loading,
    ));
    final (fail, member) = await _signUpUsecase(SignUpParam(email, password));
    if (fail != null) {
      emit(state.copyWith(
        errorMessage: fail.message,
        state: LoadState.failed,
      ));
    } else {
      emit(state.copyWith(
        state: LoadState.success,
        member: member,
      ));
    }
  }
}
