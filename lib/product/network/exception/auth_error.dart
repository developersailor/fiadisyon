enum AuthError {
  unauthorized(401),
  invalidCredentials(40),
  userNotFound(404),
  unknownError(400);

  const AuthError(this.statusCode);
  final int statusCode;
  static AuthError fromStatusCode(int statusCode) {
    switch (statusCode) {
      case 401:
        return unauthorized;
      case 400:
        return invalidCredentials;
      case 404:
        return userNotFound;
      default:
        return unknownError;
    }
  }
}
