import 'dart:io';

import 'package:chef/features/profile/domain/entity/profile_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class UserRepo {
  Future<Either<Failure, ProfileEntity>> fetchUserProfile(String uId);
  Future<Either<Failure, ProfileEntity>> updateUserProfile(ProfileEntity user);

  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, String>> uploadProfileImage(String userId, File file);
  Future<Either<Failure, String?>> getProfileImageUrl(String userId);
}
