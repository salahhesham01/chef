import 'package:chef/core/errors/failure.dart';
import 'package:chef/core/usecase/use_case.dart';
import 'package:chef/features/profile/domain/entity/profile_entity.dart';
import 'package:chef/features/profile/domain/repo/user_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class FetchUserUseCase extends UseCase<ProfileEntity, UserParams> {
  final UserRepo userRepo;

  FetchUserUseCase(this.userRepo);

  @override
  Future<Either<Failure, ProfileEntity>> call(UserParams params) {
    return userRepo.fetchUserProfile(params.uId);
  }
}

class UserParams extends Equatable {
  final String uId;

  const UserParams({required this.uId});

  @override
  List<Object?> get props => [uId];
}
