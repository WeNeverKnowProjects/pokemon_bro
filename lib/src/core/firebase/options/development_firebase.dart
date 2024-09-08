import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;
import 'package:pokemon/src/core/env/env.dart';

class DevelopmentFirebase {
  static FirebaseOptions get defaultPlatform => defaultTargetPlatform ==
          TargetPlatform.android
      ? _android
      : throw UnsupportedError("Firebase are not suppoerted for this platform");

  static final FirebaseOptions _android = FirebaseOptions(
    apiKey: Env.devFirebaseApiKey,
    appId: "1:839293404510:android:8554e281c7c0d2419f3bcf",
    messagingSenderId: "839293404510",
    projectId: Env.devFirebaseProjectId,
  );
}
