import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/exceptions/exceptions.dart';
import 'package:pokemon/src/core/firebase/authentication/firebase_authentication.dart';
import 'package:pokemon/src/core/firebase/firestore/firestore_service.dart';
import 'package:pokemon/src/core/log/logger.dart';

abstract class AuthenticationDatasource {
  Future<User?> loginWithEmail(String email, String password);
  Future<User?> createAccount(String email, String password);
  Stream<User?> authStateChange();
  Future<void> logout();
  Future<Map<String, dynamic>> updateMember(String email);
}

@LazySingleton(as: AuthenticationDatasource)
class AuthenticationDatasourceImpl implements AuthenticationDatasource {
  final FirebaseAuthentication firebaseAuth;
  final FirestoreService firestore;
  AuthenticationDatasourceImpl(this.firebaseAuth, this.firestore);

  Future<List<Map<String, dynamic>>> _getMember(String email) async =>
      firestore.getCollection<Map<String, dynamic>>(
        path: "/member",
        builder: (data, id) => data..addAll(Map.from({"uid": id})),
        queryBuilder: (query) {
          return query.where("email", isEqualTo: email).limit(1);
        },
      );

  Future<void> _addMember(String email) async {
    final collection = await _getMember(email);
    if (collection.isEmpty) {
      var uid = DateTime.now().microsecondsSinceEpoch.toString();
      await firestore.setData(
          path: "/member/$uid",
          body: Map.from({
            "email": email,
            "pokeball": 10,
            "login_at": DateTime.now().toString(),
          }));
    }
  }

  @override
  Future<User?> loginWithEmail(String email, String password) async {
    try {
      final user = await firebaseAuth.signIn(email, password);
      if (user == null) throw FirebaseAuthenticationException("User not found");
      // await _addMember(email);
      return user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthenticationException("${e.code} - ${e.message}");
    }
  }

  @override
  Future<User?> createAccount(String email, String password) async {
    try {
      final user = await firebaseAuth.createAccount(email, password);
      // await _addMember(email);
      return user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthenticationException("${e.code} ${e.message}");
    }
  }

  @override
  Stream<User?> authStateChange() => firebaseAuth.authStateChange();
  // firebaseAuth.authStateChange().asyncMap((user) async {
  //   if (user == null) return null;

  //   final collectionMember = await firestore
  //       .collectionReference("member")
  //       .where("email", isEqualTo: user.email)
  //       .get()
  //       .then((value) => value);
  //   var member = collectionMember.docs
  //       .map((docs) => docs.data()
  //         ..addAll(Map.from({
  //           "uid": docs.id,
  //         })))
  //       .toList()
  //       .first;
  //   return member;
  // }).asBroadcastStream();

  @override
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthenticationException(
          e.message ?? "Something went wrong");
    }
  }

  @override
  Future<Map<String, dynamic>> updateMember(String email) async {
    try {
      final collection = await _getMember(email);
      String uid = "${DateTime.now().microsecondsSinceEpoch}";
      int pokeball = 10;
      String loginAt = DateTime.now().toString();

      if (collection.isNotEmpty) {
        uid = collection.first['uid'];
        pokeball = (collection.first['pokeball'] as int) + 5;
        loginAt = collection.first['login_at'];
      }

      Map<String, dynamic> body = Map.from({
        "email": email,
        "pokeball": pokeball,
        "login_at": loginAt,
      });
      await firestore.setData(path: "/member/$uid", body: body);
      var members = await _getMember(email);
      Logger.d("updateMember ${members.first}");
      return members.first;
    } catch (e) {
      throw FirestoreException("$e");
    }
  }
}
