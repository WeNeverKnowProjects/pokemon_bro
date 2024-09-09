import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/failure/failure.dart';
import 'package:pokemon/src/core/usecase/usecase.dart';
import 'package:pokemon/src/features/authentication/domain/entities/member.dart';
import 'package:pokemon/src/features/authentication/domain/repository/authentication_repository.dart';

@lazySingleton
class LoadMemberUsecase implements Usecase<Member?, String> {
  final AuthenticationRepository repository;
  LoadMemberUsecase(this.repository);
  @override
  Future<(Failure?, Member?)> call(String params) async {
    return repository.loadMember(params);
  }
}
