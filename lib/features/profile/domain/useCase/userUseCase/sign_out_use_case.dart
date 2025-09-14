import 'package:chef/core/errors/failure.dart';
import 'package:chef/core/usecase/use_case.dart';
import 'package:chef/features/profile/domain/repo/user_repo.dart';
import 'package:dartz/dartz.dart';

class SignOutUseCase extends UseCase<void, NoParams> {
  final UserRepo userRepo;

  SignOutUseCase(this.userRepo);
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return userRepo.signOut();
  }
}
