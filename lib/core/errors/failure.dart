import 'package:firebase_auth/firebase_auth.dart';

/// Base Failure class
abstract class Failure {
  final String msg;
  const Failure(this.msg);
}

/// General server errors (fallback)
class ServerFailure extends Failure {
  const ServerFailure(super.msg);
}

/// Authentication failures
class AuthFailure extends Failure {
  const AuthFailure(super.msg);

  factory AuthFailure.fromFirebaseAuth(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return const AuthFailure('The email address is badly formatted.');
      case 'user-disabled':
        return const AuthFailure('This user has been disabled.');
      case 'user-not-found':
        return const AuthFailure('No user found with this email.');
      case 'wrong-password':
        return const AuthFailure('Invalid password.');
      case 'email-already-in-use':
        return const AuthFailure('This email is already registered.');
      case 'weak-password':
        return const AuthFailure('The password is too weak.');
      default:
        return AuthFailure(e.message ?? 'Unknown authentication error');
    }
  }
}

/// Firestore / Database failures
class FirestoreFailure extends Failure {
  const FirestoreFailure(super.msg);

  factory FirestoreFailure.fromFirestore(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return const FirestoreFailure(
            'You do not have permission to access this resource.');
      case 'unavailable':
        return const FirestoreFailure(
            'Firestore service is temporarily unavailable.');
      case 'not-found':
        return const FirestoreFailure('Requested document not found.');
      default:
        return FirestoreFailure(e.message ?? 'Unknown Firestore error');
    }
  }
}

/// Network related failures
class NetworkFailure extends Failure {
  const NetworkFailure([super.msg = 'No Internet connection']);
}

/// Cache / local storage failures
class CacheFailure extends Failure {
  const CacheFailure(super.msg);
}
