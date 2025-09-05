import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/assets/app_assets.dart';

class CustomProfileImage extends StatefulWidget {
  const CustomProfileImage({super.key});

  @override
  State<CustomProfileImage> createState() => _CustomProfileImageState();
}

class _CustomProfileImageState extends State<CustomProfileImage> {
  File? file;

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imageGallery =
        await picker.pickImage(source: ImageSource.gallery);

    if (imageGallery != null) {
      setState(() {
        file = File(imageGallery.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 60, bottom: 14),
        child: Stack(
          children: [
            // Profile Image
            CircleAvatar(
              radius: 90,
              backgroundImage: file != null
                  ? FileImage(file!)
                  : const AssetImage(AppAssets.profile) as ImageProvider,
            ),

            // Edit Icon Positioned
            Positioned(
              bottom: 0,
              right: 4,
              child: InkWell(
                onTap: getImage,
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
          ],
        ),
      ),
    );
  }
}
