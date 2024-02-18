import 'package:fiadisyon/features/auth/service/i_auth_service.dart';
import 'package:fiadisyon/product/network/exception/auth_error.dart';
import 'package:fiadisyon/product/network/manager/product_service_manager.dart';
import 'package:fiadisyon/product/network/manager/product_service_path.dart';
import 'package:fiadisyon/product/state/container/product_state_items.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

final class AuthService extends IAuthService {
  AuthService();

  final ProductNetworkManager _productNetworkManager =
      ProductStateItems.productNetworkManager;

  @override
  Future<AuthResponseWithStatusCode?> changePassword(
    ChangePasswordRequest request,
  ) async {
    final response =
        await _productNetworkManager.send<AuthResponse, AuthResponse>(
      ProductServicePath.changePassword.value,
      parseModel: AuthResponse(),
      method: RequestType.POST,
      data: {
        'password': request.password,
        'currentPassword': request.currentPassword,
        'passwordConfirmation': request.passwordConfirmation,
      },
    );

    try {
      return AuthResponseWithStatusCode(
        response.data,
        response.error?.statusCode,
      );
    } on AuthErrorException catch (e) {
      throw AuthErrorException(
        statusCode: e.statusCode,
        requestOptions: e.requestOptions,
      );
    }
  }

  @override
  Future<ForgotPasswordResponseWithStatusCode?> forgotPassword(
    ForgotPasswordRequest request,
  ) async {
    final response = await _productNetworkManager
        .send<ForgotPasswordResponse, ForgotPasswordResponse>(
      ProductServicePath.forgotPassword.value,
      parseModel: ForgotPasswordResponse(),
      method: RequestType.POST,
      data: {
        'email': request.email,
      },
    );

    try {
      return ForgotPasswordResponseWithStatusCode(
        response.data,
        response.error?.statusCode,
      );
    } on AuthErrorException catch (e) {
      throw AuthErrorException(
        statusCode: e.statusCode,
        requestOptions: e.requestOptions,
      );
    }
  }

  @override
  Future<AuthResponseWithStatusCode> login(
    LoginRequest request,
  ) async {
    final response =
        await _productNetworkManager.send<AuthResponse, AuthResponse>(
      ProductServicePath.auth.value,
      parseModel: AuthResponse(),
      method: RequestType.POST,
      data: {
        'identifier': request.email,
        'password': request.password,
      },
    );

    try {
      return AuthResponseWithStatusCode(
        response.data,
        response.error?.statusCode,
      );
    } on AuthErrorException catch (e) {
      throw AuthErrorException(
        statusCode: e.statusCode,
        requestOptions: e.requestOptions,
      );
    }
  }

  @override
  Future<AuthResponseWithStatusCode?> register(
    RegisterRequest request,
  ) async {
    final response =
        await _productNetworkManager.send<AuthResponse, AuthResponse>(
      ProductServicePath.register.value,
      parseModel: AuthResponse(),
      method: RequestType.POST,
      data: {
        'username': request.username,
        'email': request.email,
        'password': request.password,
      },
    );

    try {
      return AuthResponseWithStatusCode(
        response.data,
        response.error?.statusCode,
      );
    } on AuthErrorException catch (e) {
      throw AuthErrorException(
        statusCode: e.statusCode,
        requestOptions: e.requestOptions,
      );
    }
  }
}
