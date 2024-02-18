import 'package:vexana/vexana.dart';

enum AuthError {
  unauthorized,
  invalidCredentials,
  userNotFound,
  unknownError;

// hata kodu gelirse parametre olarak alınan statusCode'a göre hangi hata olduğu belirlenir.
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

class AuthErrorException implements Exception {
  AuthErrorException({this.statusCode, this.requestOptions});
  final RequestOptions? requestOptions;
  final int? statusCode;
  @override
  String toString() {
    return 'AuthErrorException: ${AuthError.fromStatusCode(statusCode!)}';
  }
}
