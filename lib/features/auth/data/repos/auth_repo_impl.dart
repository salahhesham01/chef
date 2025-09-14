import 'package:chef/core/errors/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/entity/user_entity.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepositoryImpl extends AuthRepository {
  final SupabaseClient supabase;

  AuthRepositoryImpl({required this.supabase});

  Failure _mapException(Object e) {
    if (e is AuthException) {
      return AuthFailure.fromSupabaseAuth(e);
    } else if (e is PostgrestException) {
      return DatabaseFailure.fromPostgrest(e);
    } else {
      return ServerFailure(e.toString());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user == null) {
        return left(const AuthFailure("Invalid login credentials"));
      }

      // Just return a UserEntity from auth only (no users table)
      final userEntity = UserEntity(
        uId: user.id,
        email: user.email ?? '',
        name: user.userMetadata?['name'] ?? '', // optional
        photoUrl: user.userMetadata?['photoUrl'] ?? '',
      );

      return right(userEntity);
    } catch (e) {
      return left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await supabase.auth
          .resetPasswordForEmail(email, redirectTo: 'xx://reset-password');
      return right(null);
    } catch (e) {
      return left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String newPassword,
  }) async {
    try {
      final response = await supabase.auth.updateUser(
        UserAttributes(password: newPassword),
      );

      if (response.user != null) {
        return const Right(null);
      } else {
        return Left(ServerFailure("Failed to reset password"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
