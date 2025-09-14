// UI
import 'dart:io';
import 'package:chef/core/utils/assets/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../cubit/profile_imge_cubit.dart';
import '../cubit/profile_imge_state.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use BlocConsumer if you need both listener and builder
    // or wrap the BlocBuilder with a BlocListener
    return BlocListener<ProfileImageCubit, ProfileImageState>(
      listener: (context, state) {
        // When a new image has been successfully picked...
        if (state is ProfileImagePicked) {
          // ...trigger the upload automatically.
          final userId = Supabase.instance.client.auth.currentUser?.id;
          if (userId != null) {
            // No need for 'await' here unless you want to block the UI
            // The cubit will handle emitting loading/success/failure states
            context.read<ProfileImageCubit>().uploadProfileImage(userId);
          }
        }
      },
      child: BlocBuilder<ProfileImageCubit, ProfileImageState>(
        builder: (context, state) {
          File? file;
          String? imageUrl;

          // Show a loading indicator while uploading
          bool isUploading = state is ProfileImageUploading;

          if (state is ProfileImagePicked) {
            file = state.file;
          } else if (state is ProfileImageFetched) {
            imageUrl = state.imageUrl;
          } else if (state is ProfileImageUploaded) {
            imageUrl = state.imageUrl;
          }

          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 14),
              child: Stack(
                alignment: Alignment.center, // To center the progress indicator
                children: [
                  CircleAvatar(
                    radius: 90,
                    backgroundImage: file != null
                        ? FileImage(file)
                        : imageUrl != null
                            ? NetworkImage(imageUrl)
                            : const AssetImage(AppAssets.profile)
                                as ImageProvider,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: InkWell(
                      // The onTap now only handles picking the image
                      onTap: () {
                        context.read<ProfileImageCubit>().pickImage();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.orange,
                          child: Icon(
                            Icons.edit,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Show a loading spinner on top of the image while uploading
                  if (isUploading)
                    const CircleAvatar(
                      radius: 90,
                      backgroundColor: Colors.black54,
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
