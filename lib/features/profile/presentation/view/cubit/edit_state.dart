import 'package:chef/core/entity/user_entity.dart';
import 'package:chef/features/profile/domain/entity/profile_entity.dart';

abstract class EditState {}

final class EditInitial extends EditState {}

final class EditLoading extends EditState {}

final class EditSuccess extends EditState {
  final ProfileEntity user;
  EditSuccess(this.user);
}

final class EditFailure extends EditState {
  final String errorMessage;
  EditFailure(this.errorMessage);
}
