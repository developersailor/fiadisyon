import 'package:equatable/equatable.dart';
import 'package:fiadisyon/features/auth/service/auth_service.dart';
import 'package:fiadisyon/features/auth/service/i_auth_service.dart';
import 'package:fiadisyon/product/state/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

part 'register_state.dart';

class RegisterCubit extends BaseCubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  final AuthService authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  void rememberMeChanged({bool? value}) {
    final newState = state.copyWith(rememberMe: value);
    emit(newState);
  }

  Future<AuthResponseWithStatusCode?> register() async {
    final email = emailController.text;
    final password = passwordController.text;
    final username = usernameController.text;
    final passwordConfirmation = passwordConfirmationController.text;
    emit(state.copyWith(status: RegisterStatus.loading));
    if (email.isEmpty ||
        password.isEmpty ||
        username.isEmpty ||
        passwordConfirmation.isEmpty) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage:
              'Email, password, username or password confirmation cannot be empty',
        ),
      );
      return null;
    }
    final data = await authService.register(
      RegisterRequest(
        username,
        email,
        password,
      ),
    );
    if (data?.authResponse == null) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: 'An error occurred',
        ),
      );
      return null;
    }
    emit(state.copyWith(status: RegisterStatus.success));
    return data;
  }
}
