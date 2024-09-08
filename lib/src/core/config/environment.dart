import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum EnvironmentState { development, production }

@singleton
class AppEnvironment {
  static bool isProduction = false;
  getEnv() async {
    var info = await PackageInfo.fromPlatform();
    if (info.packageName.contains("dev")) {
      isProduction = false;
    } else {
      isProduction = true;
    }
  }
}
