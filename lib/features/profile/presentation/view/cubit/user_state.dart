import 'package:chef/features/profile/domain/entity/profile_entity.dart';

abstract class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {
  final ProfileEntity userEntity;
  UserSuccess(this.userEntity);
}

final class UserFailure extends UserState {
  final String errMsg;
  UserFailure({required this.errMsg});
}

class UserSignOutSuccess extends UserState {}

class UserSignOutLoading extends UserState {}

class UserSignOutFailure extends UserState {
  final String errMsg;
  UserSignOutFailure({required this.errMsg});
}
