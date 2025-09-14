import 'package:chef/features/profile/presentation/view/cubit/user_cubit.dart';
import 'package:chef/features/profile/presentation/view/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const CustomProfileData(),
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
                CustomSignOut(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomSignOut extends StatelessWidget {
  const CustomSignOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return CustomProfileRow(
          icon: Icons.logout_sharp,
          text: 'Logout',
          onPressed: () {
            context.read<UserCubit>().signOut();
            GoRouter.of(context).pushReplacement(AppRoutes.kSingInView);
          },
          color: primaryColor,
        );
      },
    );
  }
}

class CustomProfileData extends StatelessWidget {
  const CustomProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is UserLoading) {
          return const CircularProgressIndicator();
        } else if (state is UserSuccess) {
          return Column(
            children: [
              const CustomProfileImage(),
              Text(
                state.userEntity.userEntity.name,
                style: TextStyles.latoTextStyle36Bold.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 14),
              Text(
                state.userEntity.userEntity.email,
                style: TextStyles.latoTextStyle36Bold
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          );
        } else if (state is UserFailure) {
          return Text("Error: ${state.errMsg}");
        }
        return const SizedBox.shrink();
      },
    );
  }
}
