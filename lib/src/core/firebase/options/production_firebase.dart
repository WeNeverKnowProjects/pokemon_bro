import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;
import 'package:pokemon/src/core/env/env.dart';

class ProductionFirebase {
  static FirebaseOptions get defaultPlatform => defaultTargetPlatform ==
          TargetPlatform.android
      ? _android
      : throw UnsupportedError("Firebase are not suppoerted for this platform");

  static final FirebaseOptions _android = FirebaseOptions(
    apiKey: Env.prodFirebaseApiKey,
    appId: "1:1006566752579:android:5d3f9e5367c599193d6ff6",
    messagingSenderId: "1006566752579",
    projectId: Env.prodFirebaseProjectId,
  );
}
