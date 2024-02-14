import 'package:vexana/vexana.dart';

enum AuthError {
  unauthorized,
  invalidCredentials,
  userNotFound,
  unknownError;

  String get name {
    switch (this) {
      case AuthError.unauthorized:
        return 'Unauthorized';
      case AuthError.invalidCredentials:
        return 'Invalid Credentials';
      case AuthError.userNotFound:
        return 'User Not Found';
      case AuthError.unknownError:
        return 'Unknown Error';
    }
  }
}

class AuthErrorException extends DioException {
  AuthErrorException({required this.statusCode, required super.requestOptions});

  final int? statusCode;
  static AuthError fromStatusCode(int statusCode) {
    switch (statusCode) {
      case 401:
        return AuthError.unauthorized;
      case 400:
        return AuthError.invalidCredentials;
      case 404:
        return AuthError.userNotFound;
      default:
        return AuthError.unknownError;
    }
  }
}
