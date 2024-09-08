import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
class Env {
  @EnviedField(obfuscate: true, varName: "DEV_FIREBASE_API_KEY")
  static final String devFirebaseApiKey = _Env.devFirebaseApiKey;

  @EnviedField(obfuscate: true, varName: "DEV_FIREBASE_PROJECT_ID")
  static final String devFirebaseProjectId = _Env.devFirebaseProjectId;

  @EnviedField(obfuscate: true, varName: "PROD_FIREBASE_API_KEY")
  static final String prodFirebaseApiKey = _Env.prodFirebaseApiKey;

  @EnviedField(obfuscate: true, varName: "PROD_FIREBASE_PROJECT_ID")
  static final String prodFirebaseProjectId = _Env.prodFirebaseProjectId;
}
