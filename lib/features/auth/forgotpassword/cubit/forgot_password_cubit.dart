import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fiadisyon/features/auth/service/auth_service.dart';
import 'package:fiadisyon/features/auth/service/i_auth_service.dart';
import 'package:gen/gen.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(const ForgotPasswordState());
  final IAuthService _authService = AuthService();
  Future<ForgotPasswordResponseWithStatusCode?> forgotPassword({
    required String email,
  }) async {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));
    final response = await _authService.forgotPassword(
      ForgotPasswordRequest(
        email: email,
      ),
    );
    if (response != null) {
      emit(state.copyWith(status: ForgotPasswordStatus.success));
    } else {
      emit(state.copyWith(status: ForgotPasswordStatus.failure));
    }
    return response;
  }
}
