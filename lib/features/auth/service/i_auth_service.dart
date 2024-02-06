import 'package:gen/gen.dart';

abstract class IAuthService {
  Future<AuthResponse?> login(LoginRequest request);
  Future<AuthResponse?> register(RegisterRequest request);
  Future<ForgotPasswordResponse?> forgotPassword(ForgotPasswordRequest request);
  Future<AuthResponse?> changePassword(ChangePasswordRequest request);
}
