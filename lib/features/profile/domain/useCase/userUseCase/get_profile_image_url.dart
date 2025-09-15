import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecase/use_case.dart';
import '../../repo/user_repo.dart';

class GetProfileImageUrl extends UseCase<String?, NoParams> {
  final UserRepo userRepo;

  GetProfileImageUrl(this.userRepo);

  @override
  Future<Either<Failure, String?>> call(NoParams params) {
    return userRepo.getProfileImageUrl();
  }
}
