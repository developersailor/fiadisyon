import 'package:equatable/equatable.dart';
import 'package:fiadisyon/features/auth/service/auth_service.dart';
import 'package:fiadisyon/product/state/base/base_cubit.dart';
import 'package:gen/gen.dart';

part 'register_state.dart';

class RegisterCubit extends BaseCubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  final AuthService authService = AuthService();

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  void passwordConfirmationChanged(String value) {
    emit(state.copyWith(passwordConfirmation: value));
  }

  void usernameChanged(String value) {
    emit(state.copyWith(username: value));
  }

  Future<AuthResponse?> register() async {
    if (state.email.isEmpty ||
        state.password.isEmpty ||
        state.username.isEmpty ||
        state.passwordConfirmation.isEmpty) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: 'Tüm alanlar doldurulmalıdır',
        ),
      );
      return null;
    }
    emit(state.copyWith(status: RegisterStatus.loading));
    final response = await authService.register(
      RegisterRequest(
        state.username,
        state.email,
        state.password,
      ),
    );

    emit(
      state.copyWith(
        status: RegisterStatus.success,
      ),
    );
    return response?.data;
  }
}
