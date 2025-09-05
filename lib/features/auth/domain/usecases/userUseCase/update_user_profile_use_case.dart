import 'package:chef/core/errors/failure.dart';
import 'package:chef/core/usecase/use_case.dart';
import 'package:chef/features/auth/domain/entity/user_entity.dart';
import 'package:chef/features/auth/domain/repos/user_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UpdateUserProfileUseCase extends UseCase<UserEntity, UpdateUserParams> {
  final UserRepo userRepo;

  UpdateUserProfileUseCase(this.userRepo);

  @override
  Future<Either<Failure, UserEntity>> call(UpdateUserParams params) {
    return userRepo.updateUserProfile(params.userEntity);
  }
}

class UpdateUserParams extends Equatable {
  final UserEntity userEntity;

  const UpdateUserParams({required this.userEntity});

  @override
  List<Object?> get props => [userEntity];
}
