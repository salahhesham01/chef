import 'dart:io';

import 'package:chef/core/usecase/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';
import '../../repo/user_repo.dart';

class UploadProfileImage extends UseCase<String, UploadProfileImageParams> {
  final UserRepo userRepo;

  UploadProfileImage(this.userRepo);

  @override
  Future<Either<Failure, String>> call(UploadProfileImageParams params) {
    return userRepo.uploadProfileImage(File(params.filePath));
  }
}

class UploadProfileImageParams extends Equatable {
  final String filePath;

  const UploadProfileImageParams({
    required this.filePath,
  });

  @override
  List<Object?> get props => [filePath];
}
