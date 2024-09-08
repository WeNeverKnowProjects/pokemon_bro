import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/failure/failure.dart';
import 'package:pokemon/src/core/usecase/usecase.dart';
import 'package:pokemon/src/features/authentication/domain/entities/member.dart';
import 'package:pokemon/src/features/authentication/domain/repository/authentication_repository.dart';

@lazySingleton
class LoginWithEmailUsecase implements Usecase<Member, LoginEmailParam> {
  final AuthenticationRepository repository;
  LoginWithEmailUsecase(this.repository);

  @override
  Future<(Failure?, Member?)> call(LoginEmailParam params) async {
    return repository.loginWithEmail(params.email, params.password);
  }
}

class LoginEmailParam {
  final String email;
  final String password;
  LoginEmailParam(this.email, this.password);
}
