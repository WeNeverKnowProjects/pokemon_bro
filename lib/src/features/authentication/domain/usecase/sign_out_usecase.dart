import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/failure/failure.dart';
import 'package:pokemon/src/core/usecase/usecase.dart';
import 'package:pokemon/src/features/authentication/domain/repository/authentication_repository.dart';

@lazySingleton
class SignOutUsecase implements Usecase<void, NoParam> {
  final AuthenticationRepository repository;
  SignOutUsecase(this.repository);
  @override
  Future<(Failure?, void)> call(NoParam params) async {
    return repository.signOut();
  }
}
