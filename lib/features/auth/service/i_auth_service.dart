import 'package:gen/gen.dart';

final class AuthData {
  AuthData(this.authResponse, this.statusCode);
  final AuthResponse? authResponse;
  final int? statusCode;
}

typedef AuthResponseWithStatusCode = AuthData;

final class ForgotPasswordData {
  ForgotPasswordData(this.forgotPasswordResponse, this.statusCode);
  final ForgotPasswordResponse? forgotPasswordResponse;
  final int? statusCode;
}

typedef ForgotPasswordResponseWithStatusCode = ForgotPasswordData;

abstract class IAuthService {
  Future<AuthResponseWithStatusCode?> login(
    LoginRequest request,
  );
  Future<AuthResponseWithStatusCode?> register(
    RegisterRequest request,
  );
  Future<ForgotPasswordResponseWithStatusCode?> forgotPassword(
    ForgotPasswordRequest request,
  );
  Future<AuthResponseWithStatusCode?> changePassword(
    ChangePasswordRequest request,
  );
}
