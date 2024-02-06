import 'package:fiadisyon/features/auth/service/i_auth_service.dart';
import 'package:fiadisyon/product/network/manager/product_service_manager.dart';
import 'package:fiadisyon/product/network/manager/product_service_path.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

class AuthService extends IAuthService {
  AuthService();

  final ProductNetworkManager _productServiceManager =
      ProductNetworkManager.base();

  @override
  Future<AuthResponse?> changePassword(ChangePasswordRequest request) async {
    final response =
        await _productServiceManager.send<AuthResponse, AuthResponse>(
      ProductServicePath.changePassword.value,
      parseModel: AuthResponse(),
      method: RequestType.POST,
      data: {
        'password': request.password,
        'currentPassword': request.currentPassword,
        'passwordConfirmation': request.passwordConfirmation,
      },
    );
    return response.data;
  }

  @override
  Future<ForgotPasswordResponse?> forgotPassword(
    ForgotPasswordRequest request,
  ) async {
    final response = await _productServiceManager
        .send<ForgotPasswordResponse, ForgotPasswordResponse>(
      ProductServicePath.forgotPassword.value,
      parseModel: ForgotPasswordResponse(),
      method: RequestType.POST,
      data: {
        'email': request.email,
      },
    );
    return response.data;
  }

  @override
  Future<AuthResponse?> login(LoginRequest request) async {
    final response =
        await _productServiceManager.send<AuthResponse, AuthResponse>(
      ProductServicePath.auth.value,
      parseModel: AuthResponse(),
      method: RequestType.POST,
      data: {
        'identifier': request.email,
        'password': request.password,
      },
    );
    return response.data;
  }

  @override
  Future<AuthResponse?> register(RegisterRequest request) async {
    final response =
        await _productServiceManager.send<AuthResponse, AuthResponse>(
      ProductServicePath.register.value,
      parseModel: AuthResponse(),
      method: RequestType.POST,
      data: {
        'username': request.username,
        'email': request.email,
        'password': request.password,
      },
    );
    return response.data;
  }
}
