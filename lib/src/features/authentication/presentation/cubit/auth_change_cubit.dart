import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/usecase/usecase.dart';

import 'package:pokemon/src/features/authentication/domain/entities/member.dart';
import 'package:pokemon/src/features/authentication/domain/usecase/auth_state_change_member_usecase.dart';
import 'package:pokemon/src/features/authentication/domain/usecase/sign_out_usecase.dart';
import 'package:pokemon/src/features/authentication/domain/usecase/update_member_usecase.dart';

@injectable
class AuthChangeCubit extends Cubit<Member?> {
  AuthChangeCubit(this._authStateChangeMemberUsecase, this._signOutUsecase,
      this._updateMemberUsecase)
      : super(null);

  final AuthStateChangeMemberUsecase _authStateChangeMemberUsecase;
  final SignOutUsecase _signOutUsecase;
  final UpdateMemberUsecase _updateMemberUsecase;

  Stream<Member?> authStateChange() =>
      _authStateChangeMemberUsecase().asyncMap((member) {
        if (member != null) emit(member);
        return member;
      }).asBroadcastStream();

  updateMember(String email) async {
    final (fail, member) = await _updateMemberUsecase(email);
    if (member != null) {
      emit(member);
    }
  }

  setMember(Member member) {
    emit(member);
  }

  signOut() {
    _signOutUsecase(NoParam());
    emit(null);
  }
}
