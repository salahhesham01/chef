import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecase/use_case.dart';
import '../../repo/user_repo.dart';

class GetProfileImageUrl extends UseCase<String?, GetProfileImageUrlParams> {
  final UserRepo userRepo;

  GetProfileImageUrl(this.userRepo);

  @override
  Future<Either<Failure, String?>> call(GetProfileImageUrlParams params) {
    return userRepo.getProfileImageUrl(params.userId);
  }
}

class GetProfileImageUrlParams extends Equatable {
  final String userId;

  const GetProfileImageUrlParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}
