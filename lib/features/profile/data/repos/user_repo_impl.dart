import 'dart:io';

import 'package:chef/core/errors/failure.dart';
import 'package:chef/features/profile/domain/entity/profile_entity.dart';
import 'package:chef/features/profile/domain/repo/user_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data_sources/user_remote_data_sources.dart';

class UserRepoImpl extends UserRepo {
  final UserRemoteDataSources userRemoteDataSources;

  UserRepoImpl({required this.userRemoteDataSources});

  @override
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await userRemoteDataSources.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      return right(null);
    } catch (e) {
      return failureException(e);
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> fetchUserProfile(String uId) async {
    try {
      final userProfile = await userRemoteDataSources.fetchUserProfile(uId);
      return right(userProfile);
    } catch (e) {
      return failureException(e);
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateUserProfile(
      ProfileEntity user) async {
    try {
      final updateUser = await userRemoteDataSources.updateUserProfile(user);
      return right(updateUser);
    } catch (e) {
      return failureException(e);
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await userRemoteDataSources.signOut();
      return right(null);
    } catch (e) {
      return failureException(e);
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfileImage(
      String userId, File file) async {
    try {
      final url = await userRemoteDataSources.uploadProfileImage(userId, file);
      return right(url);
    } catch (e) {
      return failureException(e);
    }
  }

  @override
  Future<Either<Failure, String?>> getProfileImageUrl(String userId) async {
    try {
      final url = await userRemoteDataSources.getProfileImageUrl(userId);

      // تأكد إن الـ url مش null
      final fixedUrl = (url != null && url.startsWith("sshttps"))
          ? url.replaceFirst("sshttps", "https")
          : url;

      return right(fixedUrl);
    } catch (e) {
      return failureException(e);
    }
  }

  Either<Failure, T> failureException<T>(Object e) {
    if (e is AuthException) {
      return left(AuthFailure.fromSupabaseAuth(e));
    } else if (e is PostgrestException) {
      return left(DatabaseFailure.fromPostgrest(e));
    } else {
      return left(ServerFailure(e.toString()));
    }
  }
}
