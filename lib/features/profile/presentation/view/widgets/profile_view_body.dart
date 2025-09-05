import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/text_style.dart';
import 'custom_profile_image.dart';
import 'custom_profile_row.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomProfileImage(),
          Text(
            'Salah Hesham',
            style: TextStyles.latoTextStyle36Bold.copyWith(fontSize: 24),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            'salahhesham163@gmail.com',
            style: TextStyles.latoTextStyle36Bold
                .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 32,
          ),
          CustomProfileRow(
            icon: Icons.person_2_outlined,
            text: 'Edit Profile',
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.kEditProfileView);
            },
          ),
          CustomProfileRow(
            icon: Icons.visibility_off_outlined,
            text: 'Password',
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.kChangePasswordView);
            },
          ),
          CustomProfileRow(
            icon: Icons.settings_outlined,
            text: 'Settings',
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.kSettingsView);
            },
          ),
          CustomProfileRow(
            icon: Icons.logout_sharp,
            text: 'Logout',
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRoutes.kSingInView);
            },
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}
