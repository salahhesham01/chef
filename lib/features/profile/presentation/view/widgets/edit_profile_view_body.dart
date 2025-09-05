import 'package:chef/core/utils/widgets/custom_btn.dart';
import 'package:chef/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:chef/features/profile/presentation/view/widgets/custom_profile_image.dart';
import 'package:flutter/material.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CustomProfileImage(),
              const SizedBox(height: 24),
              CustomTextField(hintText: 'E-mail'),
              const SizedBox(height: 24),
              CustomTextField(hintText: 'Phone'),
              const SizedBox(height: 24),
              CustomTextField(hintText: 'Brand Name'),
              const SizedBox(height: 24),
              CustomTextField(hintText: 'Description'),
              const SizedBox(height: 24),
              CustomTextField(hintText: 'Location'),
              const SizedBox(height: 34),
              CustomBtn(text: 'Update', onPressed: () {}),
              const SizedBox(height: 24),
            ],
          ),
        )
      ],
    );
  }
}
