import '../../../../../../core/entity/user_entity.dart';

abstract class SingInState {}

final class SingInInitial extends SingInState {}

final class SingInLoading extends SingInState {}

final class SingInSuccess extends SingInState {
  final UserEntity user;
  SingInSuccess(this.user);
}

final class SingInFailure extends SingInState {
  final String errMsg;
  SingInFailure({required this.errMsg});
}

final class SingInPasswordVisibilityChanged extends SingInState {
  final bool obscureText;
  SingInPasswordVisibilityChanged(this.obscureText);
}
