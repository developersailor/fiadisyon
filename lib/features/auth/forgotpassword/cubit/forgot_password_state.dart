part of 'forgot_password_cubit.dart';

enum ForgotPasswordStatus { initial, loading, success, failure }

extension ForgotPasswordStatusExtension on ForgotPasswordStatus {
  bool get isInitial => this == ForgotPasswordStatus.initial;
  bool get isLoading => this == ForgotPasswordStatus.loading;
  bool get isSuccess => this == ForgotPasswordStatus.success;
  bool get isFailure => this == ForgotPasswordStatus.failure;
}

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    this.email = '',
    this.status = ForgotPasswordStatus.initial,
    this.errorMessage = '',
    this.forgotPasswordResponse,
  });

  final String email;
  final ForgotPasswordStatus status;
  final String errorMessage;
  final ForgotPasswordResponseWithStatusCode? forgotPasswordResponse;

  ForgotPasswordState copyWith({
    String? email,
    ForgotPasswordStatus? status,
    String? errorMessage,
    ForgotPasswordResponseWithStatusCode? forgotPasswordResponse,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      forgotPasswordResponse:
          forgotPasswordResponse ?? this.forgotPasswordResponse,
    );
  }

  @override
  List<Object?> get props => [email, status, errorMessage];
}
