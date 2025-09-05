import 'package:chef/core/usecase/use_case.dart';
import 'package:chef/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';

class ResetPasswordUseCase extends UseCase<void, ResetParams> {
  final AuthRepository authRepository;

  ResetPasswordUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(ResetParams params) {
    return authRepository.sendPasswordResetEmail(email: params.email);
  }
}

class ResetParams extends Equatable {
  final String email;

  const ResetParams({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}
