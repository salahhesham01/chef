import 'package:supabase_flutter/supabase_flutter.dart';

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

  factory AuthFailure.fromSupabaseAuth(AuthException e) {
    final code = e.code?.toLowerCase(); // Supabase gives optional error codes
    switch (code) {
      case 'invalid_credentials':
        return const AuthFailure('Invalid email or password.');
      case 'email_exists':
        return const AuthFailure('This email is already registered.');
      case 'user_not_found':
        return const AuthFailure('No user found with this email.');
      case 'weak_password':
        return const AuthFailure('The password is too weak.');
      default:
        return AuthFailure(e.message);
    }
  }
}

/// Database / Postgres failures
class DatabaseFailure extends Failure {
  const DatabaseFailure(super.msg);

  factory DatabaseFailure.fromPostgrest(PostgrestException e) {
    switch (e.code) {
      case '42501': // insufficient_privilege
        return const DatabaseFailure(
            'You do not have permission to access this resource.');
      case '42P01': // undefined_table
        return const DatabaseFailure('Requested table or resource not found.');
      case '40001': // serialization_failure
        return const DatabaseFailure(
            'Database transaction failed, please try again.');
      default:
        return DatabaseFailure(e.message);
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
