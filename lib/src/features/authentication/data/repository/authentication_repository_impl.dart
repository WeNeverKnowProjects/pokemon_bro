import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/exceptions/exceptions.dart';
import 'package:pokemon/src/core/failure/failure.dart';
import 'package:pokemon/src/core/log/logger.dart';
import 'package:pokemon/src/core/mapper/record_mapper.dart';
import 'package:pokemon/src/features/authentication/data/datasource/authentication_datasource.dart';

import 'package:pokemon/src/features/authentication/domain/entities/member.dart';

import '../../domain/repository/authentication_repository.dart';

@LazySingleton(as: AuthenticationRepository)
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDatasource datasource;
  AuthenticationRepositoryImpl(this.datasource);

  @override
  Future<(Failure?, Member?)> createAccount(
      String email, String password) async {
    try {
      final user = await datasource.createAccount(email, password);
      Member member = Member(uid: user?.uid, email: user?.email);
      return getItems<Member>(member);
    } on FirebaseAuthenticationException catch (e) {
      return getError(SubmitFailure(e.message));
    }
  }

  @override
  Future<(Failure?, Member?)> loginWithEmail(
      String email, String password) async {
    try {
      final user = await datasource.loginWithEmail(email, password);
      Member member = Member(
        uid: user?.uid,
        email: user?.email,
      );
      return getItems<Member>(member);
    } on FirebaseAuthenticationException catch (e) {
      return getError(SubmitFailure(e.message));
    }
  }

  @override
  Stream<Member?> authStateChange() {
    return datasource.authStateChange().asyncMap((user) {
      Logger.d("authStateChange $user");
      if (user != null) {
        return Member(
          uid: user.uid,
          email: user.email,
        );
        // return Member(
        //   uid: user['uid'],
        //   email: user['email'],
        //   loginAt: user['login_at'] == null
        //       ? null
        //       : DateTime.tryParse(user['login_at']),
        //   pokeball: user['pokeball'],
        // );
      }
    }).asBroadcastStream();
  }

  @override
  Future<(Failure?, void)> signOut() async {
    try {
      await datasource.logout();
      return getItems<VoidCallback>(() {});
    } on FirebaseAuthenticationException catch (e) {
      return getError(SubmitFailure(e.message));
    }
  }

  @override
  Future<(Failure?, Member?)> updateMember(String email) async {
    try {
      final result = await datasource.updateMember(email);
      if (result == null) return getError(SubmitFailure("Member not found."));
      var member = Member.fromJson(result);
      Logger.d("member ${member.pokeball} ${member.loginAt}");
      return getItems<Member?>(member);
    } on FirestoreException catch (e) {
      return getError(SubmitFailure(e.message));
    }
  }

  @override
  Future<(Failure?, Member?)> addMember(String email) async {
    try {
      final result = await datasource.addMember(email);
      if (result == null) return getError(SubmitFailure("Member not found."));
      var member = Member.fromJson(result);
      return getItems<Member?>(member);
    } on FirestoreException catch (e) {
      return getError(SubmitFailure(e.message));
    }
  }
}
