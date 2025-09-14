import 'package:bloc/bloc.dart';
import 'package:chef/features/profile/domain/useCase/userUseCase/change_password_use_case.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordCubit(this.changePasswordUseCase)
      : super(ChangePasswordInitial());

  String? password;
  String? newPassword;
  String? confirmPassword;

  bool oldObscure = true;
  bool newObscure = true;
  bool confirmObscure = true;

  void toggleOldPasswordVisibility() {
    oldObscure = !oldObscure;
    emit(ChangePasswordVisibilityChanged());
  }

  void toggleNewPasswordVisibility() {
    newObscure = !newObscure;
    emit(ChangePasswordVisibilityChanged());
  }

  void toggleConfirmPasswordVisibility() {
    confirmObscure = !confirmObscure;
    emit(ChangePasswordVisibilityChanged());
  }

  Future<void> changePassword() async {
    emit(ChangePasswordLoading());
    final result = await changePasswordUseCase(
      ChangePasswordParams(
        currentPassword: password!,
        newPassword: newPassword!,
      ),
    );

    result.fold(
      (failure) => emit(ChangePasswordFailure(failure.msg)),
      (_) => emit(ChangePasswordSuccess(newPassword!)),
    );
  }
}
