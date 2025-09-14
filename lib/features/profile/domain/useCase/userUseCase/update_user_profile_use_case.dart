import 'package:chef/core/errors/failure.dart';
import 'package:chef/core/usecase/use_case.dart';
import 'package:chef/features/profile/domain/repo/user_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../entity/profile_entity.dart';

class UpdateUserProfileUseCase
    extends UseCase<ProfileEntity, UpdateUserParams> {
  final UserRepo userRepo;

  UpdateUserProfileUseCase(this.userRepo);

  @override
  Future<Either<Failure, ProfileEntity>> call(UpdateUserParams params) {
    return userRepo.updateUserProfile(params.userModel);
  }
}

class UpdateUserParams extends Equatable {
  final ProfileEntity userModel;

  const UpdateUserParams({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}
