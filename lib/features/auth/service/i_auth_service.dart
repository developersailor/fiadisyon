import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

abstract class IAuthService {
  Future<IResponseModel<AuthResponse?, EmptyModel?>?> login(
    LoginRequest request,
  );
  Future<IResponseModel<AuthResponse?, EmptyModel?>?> register(
    RegisterRequest request,
  );
  Future<IResponseModel<ForgotPasswordResponse?, EmptyModel?>?> forgotPassword(
    ForgotPasswordRequest request,
  );
  Future<IResponseModel<AuthResponse?, EmptyModel?>?> changePassword(
    ChangePasswordRequest request,
  );
}
