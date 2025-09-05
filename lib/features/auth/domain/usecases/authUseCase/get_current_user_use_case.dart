import 'package:chef/core/errors/failure.dart';
import 'package:chef/core/usecase/use_case.dart';
import 'package:chef/features/auth/domain/entity/user_entity.dart';
import 'package:chef/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class GetCurrentUserUseCase extends UseCase<UserEntity?, NoParams> {
  final AuthRepository authRepository;

  GetCurrentUserUseCase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity?>> call(NoParams params) {
    return authRepository.getCurrentUser();
  }
}
