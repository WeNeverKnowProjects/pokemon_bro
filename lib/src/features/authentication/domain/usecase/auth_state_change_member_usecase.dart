import 'package:injectable/injectable.dart';
import 'package:pokemon/src/features/authentication/domain/entities/member.dart';
import 'package:pokemon/src/features/authentication/domain/repository/authentication_repository.dart';

@lazySingleton
class AuthStateChangeMemberUsecase {
  final AuthenticationRepository repository;
  AuthStateChangeMemberUsecase(this.repository);

  Stream<Member?> call() => repository.authStateChange();
}
