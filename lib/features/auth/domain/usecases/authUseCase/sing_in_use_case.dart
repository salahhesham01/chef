import 'package:chef/core/usecase/use_case.dart';
import 'package:chef/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/entity/user_entity.dart';
import '../../../../../core/errors/failure.dart';

class SignInUseCase extends UseCase<UserEntity, SignInParams> {
  final AuthRepository authRepository;

  SignInUseCase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(SignInParams params) {
    return authRepository.signInWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  const SignInParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
