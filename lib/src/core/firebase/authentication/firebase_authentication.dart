import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class FirebaseAuthentication {
  User? get currentUser;
  Future<void> signOut();
  Future<User?> signIn(String email, String password);
  Future<User?> createAccount(String email, String password);
  Stream<User?> authStateChange();
}

@Singleton(as: FirebaseAuthentication)
class FirebaseAuthenticationImpl implements FirebaseAuthentication {
  final FirebaseAuth service;
  FirebaseAuthenticationImpl(this.service);
  @override
  Future<User?> createAccount(String email, String password) async {
    final credential = await service.createUserWithEmailAndPassword(
        email: email, password: password);
    return credential.user;
  }

  @override
  User? get currentUser => service.currentUser;

  @override
  Future<User?> signIn(String email, String password) async {
    final credential = await service.signInWithEmailAndPassword(
        email: email, password: password);
    return credential.user;
  }

  @override
  Future<void> signOut() async {
    await service.signOut();
  }

  @override
  Stream<User?> authStateChange() => service.authStateChanges();
}
