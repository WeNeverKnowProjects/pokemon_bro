import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/failure/failure.dart';
import 'package:pokemon/src/core/usecase/usecase.dart';
import 'package:pokemon/src/features/authentication/domain/entities/member.dart';
import 'package:pokemon/src/features/authentication/domain/repository/authentication_repository.dart';

@lazySingleton
class UpdateMemberUsecase implements Usecase<Member, String> {
  final AuthenticationRepository repository;
  UpdateMemberUsecase(this.repository);

  @override
  Future<(Failure?, Member?)> call(String email) =>
      repository.updateMember(email);
}
