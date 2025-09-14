abstract class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordLoading extends ChangePasswordState {}

final class ChangePasswordSuccess extends ChangePasswordState {
  String newPassword;
  ChangePasswordSuccess(this.newPassword);
}

final class ChangePasswordFailure extends ChangePasswordState {
  final String errorMessage;
  ChangePasswordFailure(this.errorMessage);
}

final class ForgetPasswordPasswordVisibilityChanged
    extends ChangePasswordState {
  final bool obscureText;
  ForgetPasswordPasswordVisibilityChanged(this.obscureText);
}

final class ChangePasswordVisibilityChanged extends ChangePasswordState {}
