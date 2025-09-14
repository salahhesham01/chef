import 'package:dartz/dartz.dart';
import '../../../../core/entity/user_entity.dart';
import '../../../../core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> sendPasswordResetEmail({
    required String email,
  });
  Future<Either<Failure, void>> resetPassword({
    required String newPassword,
  });
}
