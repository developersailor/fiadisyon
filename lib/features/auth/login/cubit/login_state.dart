part of 'login_cubit.dart';

enum LoginStatus { initial, loading, success, failure }

extension LoginStatusExtension on LoginStatus {
  bool get isInitial => this == LoginStatus.initial;
  bool get isLoading => this == LoginStatus.loading;
  bool get isSuccess => this == LoginStatus.success;
  bool get isFailure => this == LoginStatus.failure;
}

class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.status = LoginStatus.initial,
    this.errorMessage = '',
    this.kvkkChecked = false,
    this.rememberMe = false,
    this.authResponse,
  });

  final String email;
  final String password;
  final LoginStatus status;
  final String errorMessage;
  final bool kvkkChecked;
  final bool rememberMe;
  final AuthResponseWithStatusCode? authResponse;

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
    String? errorMessage,
    bool? kvkkChecked,
    bool? rememberMe,
    AuthResponseWithStatusCode? authResponse,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      kvkkChecked: kvkkChecked ?? this.kvkkChecked,
      rememberMe: rememberMe ?? this.rememberMe,
      authResponse: authResponse ?? this.authResponse,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        status,
        errorMessage,
        kvkkChecked,
        rememberMe,
        authResponse,
      ];
}
