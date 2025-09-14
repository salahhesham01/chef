import 'dart:io';

abstract class ProfileImageState {}

class ProfileImageInitial extends ProfileImageState {}

class ProfileImageLoading extends ProfileImageState {}

class ProfileImagePicked extends ProfileImageState {
  final File file;
  ProfileImagePicked(this.file);
}

class ProfileImageFailure extends ProfileImageState {
  final String message;
  ProfileImageFailure(this.message);
}

class ProfileImageUploading extends ProfileImageState {}

class ProfileImageUploaded extends ProfileImageState {
  final String imageUrl;
  ProfileImageUploaded(this.imageUrl);
}

class ProfileImageFetching extends ProfileImageState {}

class ProfileImageFetched extends ProfileImageState {
  final String imageUrl;
  ProfileImageFetched(this.imageUrl);
}
