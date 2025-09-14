abstract class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {}

class ForgetPasswordFailure extends ForgetPasswordState {
  final String message;
  ForgetPasswordFailure(this.message);
}

final class ForgetPasswordPasswordVisibilityChanged
    extends ForgetPasswordState {
  final bool obscureText;
  ForgetPasswordPasswordVisibilityChanged(this.obscureText);
}

class NewPasswordLoading extends ForgetPasswordState {}

class NewPasswordSuccess extends ForgetPasswordState {}

class NewPasswordFailure extends ForgetPasswordState {
  final String message;
  NewPasswordFailure(this.message);
}
