import 'package:equatable/equatable.dart';
import 'package:fiadisyon/features/auth/service/auth_service.dart';
import 'package:fiadisyon/product/state/base/base_cubit.dart';
import 'package:gen/gen.dart';

part 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(const LoginState());
  final AuthService authService = AuthService();
  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  void kvkkChanged({bool? value}) {
    emit(state.copyWith(kvkkChecked: value));
  }

  void rememberMeChanged({bool? value}) {
    emit(state.copyWith(rememberMe: value));
  }

  Future<AuthResponse?> login() async {
    if (state.email.isEmpty || state.password.isEmpty) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          errorMessage: 'Email ve şifre alanları boş olamaz',
        ),
      );
      return null;
    }
    emit(state.copyWith(status: LoginStatus.loading));
    final response = await authService.login(
      LoginRequest(
        state.email,
        state.password,
      ),
    );

    if (response != null) {
      emit(state.copyWith(status: LoginStatus.success));
      return response;
    } else {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          errorMessage: 'Giriş başarısız',
        ),
      );
      return null;
    }
  }
}
