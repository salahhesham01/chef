import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

import '../entity/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> sendPasswordResetEmail({
    required String email,
  });

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, UserEntity?>> getCurrentUser();
}
