import 'package:pokemon/src/core/failure/failure.dart';
import 'package:pokemon/src/features/authentication/domain/entities/member.dart';

abstract class AuthenticationRepository {
  Future<(Failure?, Member?)> loginWithEmail(String email, String password);
  Future<(Failure?, Member?)> createAccount(String email, String password);
  Stream<Member?> authStateChange();
  Future<(Failure?, void)> signOut();
  Future<(Failure?, Member?)> updateMember(String email);
  Future<(Failure?, Member?)> addMember(String email);
}
