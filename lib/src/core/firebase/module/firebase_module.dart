import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/config/environment.dart' as env;
import 'package:pokemon/src/core/firebase/options/development_firebase.dart';
import 'package:pokemon/src/core/firebase/options/production_firebase.dart';

@module
abstract class FirebaseModule {
  @preResolve
  Future<FirebaseApp> get initFirebaseApp async => await Firebase.initializeApp(
      options: env.AppEnvironment.isProduction
          ? ProductionFirebase.defaultPlatform
          : DevelopmentFirebase.defaultPlatform);

  @singleton
  FirebaseAuth get auth => FirebaseAuth.instance;

  @singleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
}
