part of 'register_cubit.dart';

enum RegisterStatus { initial, loading, success, failure }

extension RegisterStatusExtension on RegisterStatus {
  bool get isInitial => this == RegisterStatus.initial;
  bool get isLoading => this == RegisterStatus.loading;
  bool get isSuccess => this == RegisterStatus.success;
  bool get isFailure => this == RegisterStatus.failure;
}

class RegisterState extends Equatable {
  const RegisterState({
    this.email = '',
    this.password = '',
    this.username = '',
    this.status = RegisterStatus.initial,
    this.errorMessage = '',
    this.passwordConfirmation = '',
    this.rememberMe,
    this.authResponse,
  });

  final String email;
  final String password;
  final String username;
  final RegisterStatus status;
  final String errorMessage;
  final String passwordConfirmation;
  final bool? rememberMe;
  final AuthResponseWithStatusCode? authResponse;

  RegisterState copyWith({
    String? email,
    String? password,
    String? username,
    RegisterStatus? status,
    String? errorMessage,
    String? passwordConfirmation,
    bool? rememberMe,
    AuthResponseWithStatusCode? authResponse,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      rememberMe: rememberMe ?? this.rememberMe,
      authResponse: authResponse ?? this.authResponse,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        username,
        status,
        errorMessage,
        passwordConfirmation,
        rememberMe,
        authResponse,
      ];
}
