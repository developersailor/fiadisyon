import 'package:equatable/equatable.dart';
import 'package:fiadisyon/features/auth/service/auth_service.dart';
import 'package:fiadisyon/features/auth/service/i_auth_service.dart';
import 'package:fiadisyon/product/state/base/base_cubit.dart';
import 'package:gen/gen.dart';

part 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(const LoginState());
  final AuthService authService = AuthService();

  void rememberMeChanged({bool? value}) {
    final newState = state.copyWith(rememberMe: value);
    emit(newState);
  }

  Future<AuthResponseWithStatusCode?> login(
    String email,
    String password,
  ) async {
    emit(state.copyWith(status: LoginStatus.loading));
    if (email.isEmpty || password.isEmpty) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          errorMessage: 'Email or password cannot be empty',
        ),
      );
      return null;
    }
    final data = await authService.login(
      LoginRequest(
        email,
        password,
      ),
    );
    if (data.authResponse == null) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          errorMessage: 'An error occurred',
        ),
      );
      return null;
    }
    emit(state.copyWith(status: LoginStatus.success));
    return data;
  }
}
