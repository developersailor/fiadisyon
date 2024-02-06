import 'package:flutter/foundation.dart';
import 'package:gen/gen.dart';

/// Applicaiton envrioment manager class
final class AppEnvironment {
  /// Setup application environment
  AppEnvironment.setup({required AppConfiguration config}) {
    _config = config;
  }
  AppEnvironment.general() {
    _config = !kDebugMode ? DevEnv() : ProdEnv();
  }
  static late final AppConfiguration _config;
}

enum AppEnvironmentItems {
  baseUrl,
  apiKey;

  String get value {
    try {
      switch (this) {
        case AppEnvironmentItems.baseUrl:
          return AppEnvironment._config.baseUrl;
        case AppEnvironmentItems.apiKey:
          return AppEnvironment._config.apiKey;
      }
    } catch (e) {
      throw Exception('AppEnvironmentItems is not initialized');
    }
  }
}
