import 'package:envied/envied.dart';
import 'package:gen/src/environment/app_configuration.dart';

part 'stage_env.g.dart';

@Envied(path: 'assets/env/.stage.env', obfuscate: true)

/// Production environment variables
final class StageEnv implements AppConfiguration {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _StageEnv._baseUrl;

  @EnviedField(varName: 'API_KEY')
  static final String _apiKey = _StageEnv._apiKey;

  @override
  String get apiKey => _apiKey;

  @override
  String get baseUrl => _baseUrl;
}
