import 'package:equatable/equatable.dart';
import 'package:fiadisyon/features/auth/service/auth_service.dart';
import 'package:fiadisyon/product/state/base/base_cubit.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

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
    }
    emit(state.copyWith(status: LoginStatus.loading));
    final data = await authService.login(
      LoginRequest(
        state.email,
        state.password,
      ),
    );

    emit(state.copyWith(status: LoginStatus.success));
    return data;
  }
}
