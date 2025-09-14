import 'package:chef/core/usecase/use_case.dart';
import 'package:chef/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';

class SendResetPasswordUseCase extends UseCase<void, ResetEmailParams> {
  final AuthRepository authRepository;

  SendResetPasswordUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(ResetEmailParams params) {
    return authRepository.sendPasswordResetEmail(email: params.email);
  }
}

class ResetEmailParams extends Equatable {
  final String email;

  const ResetEmailParams({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}
