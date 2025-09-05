import 'package:chef/core/errors/failure.dart';
import 'package:chef/features/auth/data/models/user_model.dart';
import 'package:chef/features/auth/domain/entity/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repos/auth_repo.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore fireStore;

  AuthRepositoryImpl({
    required this.firebaseAuth,
    required this.fireStore,
  });

  Failure _mapException(Object e) {
    if (e is FirebaseAuthException) {
      return AuthFailure.fromFirebaseAuth(e);
    } else if (e is FirebaseException) {
      return FirestoreFailure.fromFirestore(e);
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
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final doc =
          await fireStore.collection("users").doc(credential.user!.uid).get();

      if (!doc.exists) {
        return left(const ServerFailure("User profile not found in Firestore"));
      }

      return right(UserModel.fromDoc(doc));
    } catch (e) {
      return left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return right(null);
    } catch (e) {
      return left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await firebaseAuth.signOut();
      return right(null);
    } catch (e) {
      return left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final user = firebaseAuth.currentUser;
      if (user == null) return right(null);

      final doc = await fireStore.collection("users").doc(user.uid).get();
      if (!doc.exists) return right(null);

      return right(UserModel.fromDoc(doc));
    } catch (e) {
      return left(_mapException(e));
    }
  }
}
