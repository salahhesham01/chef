import 'package:chef/core/errors/failure.dart';
import 'package:chef/core/usecase/use_case.dart';
import 'package:chef/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class SignOutUseCase extends UseCase<void, NoParams> {
  final AuthRepository authRepository;

  SignOutUseCase(this.authRepository);
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return authRepository.signOut();
  }
}
