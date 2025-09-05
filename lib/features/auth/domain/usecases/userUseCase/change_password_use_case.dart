import 'package:chef/core/errors/failure.dart';
import 'package:chef/core/usecase/use_case.dart';
import 'package:chef/features/auth/domain/repos/user_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ChangePasswordUseCase extends UseCase<void, ChangePasswordParams> {
  final UserRepo userRepo;

  ChangePasswordUseCase(this.userRepo);

  @override
  Future<Either<Failure, void>> call(ChangePasswordParams params) {
    return userRepo.changePassword(
        currentPassword: params.currentPassword,
        newPassword: params.newPassword);
  }
}

class ChangePasswordParams extends Equatable {
  final String currentPassword;
  final String newPassword;

  const ChangePasswordParams(
      {required this.currentPassword, required this.newPassword});

  @override
  List<Object?> get props => [currentPassword, newPassword];
}
