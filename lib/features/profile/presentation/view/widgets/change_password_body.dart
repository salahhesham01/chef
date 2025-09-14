import 'package:chef/core/utils/text_style.dart';
import 'package:chef/core/utils/widgets/custom_btn.dart';
import 'package:chef/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:chef/features/profile/presentation/view/cubit/change_password_cubit.dart';
import 'package:chef/features/profile/presentation/view/cubit/change_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets/app_assets.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 37, right: 38),
                child: AspectRatio(
                    aspectRatio: 2 / 2.2,
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.lock),
                              fit: BoxFit.fill)),
                    )),
              ),
              const SizedBox(
                height: 26,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Change Password',
                  style: TextStyles.latoTextStyle36Bold
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomChangePasswordForm(),
            ],
          ),
        )
      ],
    );
  }
}

class CustomChangePasswordForm extends StatelessWidget {
  CustomChangePasswordForm({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Password updated successfully")),
          );
          // optional: sign out user here
        } else if (state is ChangePasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        ChangePasswordCubit changePasswordCubit =
            context.read<ChangePasswordCubit>();
        return Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Old Password',
                obscureText: changePasswordCubit.oldObscure,
                suffixIcon: IconButton(
                  onPressed: () =>
                      changePasswordCubit.toggleOldPasswordVisibility(),
                  icon: Icon(changePasswordCubit.oldObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                ),
                onChanged: (pass) => changePasswordCubit.password = pass,
                validator: (value) => value == null || value.isEmpty
                    ? "Password is required"
                    : null,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                hintText: 'New Password',
                obscureText: changePasswordCubit.newObscure,
                suffixIcon: IconButton(
                  onPressed: () =>
                      changePasswordCubit.toggleNewPasswordVisibility(),
                  icon: Icon(changePasswordCubit.newObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                ),
                onChanged: (pass) => changePasswordCubit.newPassword = pass,
                validator: (value) => value == null || value.isEmpty
                    ? "Password is required"
                    : null,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                hintText: 'Confirm New Password',
                obscureText: changePasswordCubit.confirmObscure,
                suffixIcon: IconButton(
                  onPressed: () =>
                      changePasswordCubit.toggleConfirmPasswordVisibility(),
                  icon: Icon(changePasswordCubit.confirmObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                ),
                onChanged: (pass) => changePasswordCubit.confirmPassword = pass,
                validator: (value) => value == null || value.isEmpty
                    ? "Password is required"
                    : null,
              ),
              const SizedBox(
                height: 40,
              ),
              CustomBtn(
                text: 'Change Password',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (changePasswordCubit.newPassword !=
                        changePasswordCubit.confirmPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Passwords do not match")),
                      );
                      return;
                    }
                    changePasswordCubit.changePassword();
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        );
      },
    );
  }
}
