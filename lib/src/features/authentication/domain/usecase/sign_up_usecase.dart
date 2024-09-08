import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/failure/failure.dart';
import 'package:pokemon/src/core/usecase/usecase.dart';
import 'package:pokemon/src/features/authentication/domain/entities/member.dart';
import 'package:pokemon/src/features/authentication/domain/repository/authentication_repository.dart';

@lazySingleton
class SignUpUsecase implements Usecase<Member, SignUpParam> {
  final AuthenticationRepository repository;
  SignUpUsecase(this.repository);

  @override
  Future<(Failure?, Member?)> call(SignUpParam params) async {
    return repository.createAccount(params.email, params.password);
  }
}

class SignUpParam {
  final String email;
  final String password;
  SignUpParam(this.email, this.password);
}
