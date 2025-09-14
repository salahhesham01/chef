import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../domain/useCase/userUseCase/upload_profile_image.dart';
import '../../../domain/useCase/userUseCase/get_profile_image_url.dart';
import 'profile_imge_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  final UploadProfileImage uploadProfileImageUseCase;
  final GetProfileImageUrl getProfileImageUrlUseCase;

  ProfileImageCubit({
    required this.uploadProfileImageUseCase,
    required this.getProfileImageUrlUseCase,
  }) : super(ProfileImageInitial());

  final ImagePicker _picker = ImagePicker();
  File? selectedFile;

  Future<void> pickImage() async {
    try {
      emit(ProfileImageLoading());
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        selectedFile = File(image.path);
        emit(ProfileImagePicked(selectedFile!));
      }
    } catch (e) {
      emit(ProfileImageFailure("Error picking image: $e"));
    }
  }

  Future<void> uploadProfileImage(String userId) async {
    if (selectedFile == null) {
      emit(ProfileImageFailure("No image selected"));
      return;
    }
    emit(ProfileImageUploading());

    final result = await uploadProfileImageUseCase(
      UploadProfileImageParams(userId: userId, filePath: selectedFile!.path),
    );

    result.fold(
      (failure) => emit(ProfileImageFailure(failure.msg)),
      (url) => emit(ProfileImageUploaded(url)),
    );
  }

  Future<void> getProfileImage(String userId) async {
    emit(ProfileImageFetching());

    final result = await getProfileImageUrlUseCase(
      GetProfileImageUrlParams(userId: userId),
    );

    result.fold(
      (failure) => emit(ProfileImageFailure(failure.msg)),
      (url) {
        if (url != null) {
          emit(ProfileImageFetched(url));
        } else {
          emit(ProfileImageInitial());
        }
      },
    );
  }
}
