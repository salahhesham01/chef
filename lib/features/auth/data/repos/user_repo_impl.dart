import 'package:chef/core/errors/failure.dart';
import 'package:chef/features/auth/data/data_sources/user_remote_data_sources.dart';
import 'package:chef/features/auth/domain/entity/user_entity.dart';
import 'package:chef/features/auth/domain/repos/user_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepoImpl extends UserRepo {
  final UserRemoteDataSources userRemoteDataSources;

  UserRepoImpl({required this.userRemoteDataSources});

  @override
  Future<Either<Failure, void>> changePassword(
      {required String currentPassword, required String newPassword}) async {
    try {
      await userRemoteDataSources.changePassword(
          currentPassword: currentPassword, newPassword: newPassword);
      return right(null);
    } catch (e) {
      return failureException(e);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> fetchUserProfile(String uId) async {
    try {
      final userProfile = await userRemoteDataSources.fetchUserProfile(uId);
      return right(userProfile);
    } catch (e) {
      return failureException(e);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUserProfile(UserEntity user) async {
    try {
      final updateUser = await userRemoteDataSources.updateUserProfile(user);
      return right(updateUser);
    } catch (e) {
      return failureException(e);
    }
  }

  Either<Failure, UserEntity> failureException(Object e) {
    if (e is FirebaseAuthException) {
      return left(AuthFailure.fromFirebaseAuth(e));
    } else if (e is FirebaseException) {
      return left(FirestoreFailure.fromFirestore(e));
    } else {
      return left(ServerFailure(e.toString()));
    }
  }
}
