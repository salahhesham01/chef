import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/authUseCase/reset_passwoed_use_case.dart';
import '../../../../domain/usecases/authUseCase/send_reset_password_use_case.dart';
import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final SendResetPasswordUseCase sendResetPasswordUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  ForgetPasswordCubit({
    required this.sendResetPasswordUseCase,
    required this.resetPasswordUseCase,
  }) : super(ForgetPasswordInitial());

  String? email;
  bool obscureText = true;
  String? password;

  Future<void> sendResetEmail() async {
    if (email == null || email!.isEmpty) {
      emit(ForgetPasswordFailure("Please enter your email"));
      return;
    }

    emit(ForgetPasswordLoading());

    final result = await sendResetPasswordUseCase(
      ResetEmailParams(email: email!),
    );

    result.fold(
      (failure) => emit(ForgetPasswordFailure(failure.msg)),
      (_) => emit(ForgetPasswordSuccess()),
    );
  }

  void obscurePasswordText() {
    obscureText = !obscureText;
    emit(ForgetPasswordPasswordVisibilityChanged(obscureText));
  }

  Future<void> resetPassword(String newPassword) async {
    if (newPassword.isEmpty) {
      emit(NewPasswordFailure("All fields are required"));
      return;
    }

    emit(NewPasswordLoading());

    final result = await resetPasswordUseCase(
      ResetParams(password: newPassword),
    );

    result.fold(
      (failure) => emit(NewPasswordFailure(failure.msg)),
      (_) => emit(NewPasswordSuccess()),
    );
  }
}
