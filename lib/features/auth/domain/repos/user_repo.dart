import 'package:chef/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class UserRepo {
  Future<Either<Failure, UserEntity>> fetchUserProfile(String uId);
  Future<Either<Failure, UserEntity>> updateUserProfile(UserEntity user);

  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}
