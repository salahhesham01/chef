import 'package:chef/core/utils/text_style.dart';
import 'package:chef/core/utils/widgets/custom_btn.dart';
import 'package:chef/features/auth/presentation/views/sign_in_view.dart';
import 'package:chef/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets/app_assets.dart';
import '../cubit/forgetPassword/forget_password_cubit.dart';
import '../cubit/forgetPassword/forget_password_state.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
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
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  textAlign: TextAlign.center,
                  'Create new password',
                  style: TextStyles.latoTextStyle36Bold
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              const ForgetPasswordForm()
            ],
          ),
        )
      ],
    );
  }
}

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is NewPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Password changed!")),
          );
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SignInView()));
        } else if (state is NewPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        ForgetPasswordCubit cubit = context.read<ForgetPasswordCubit>();

        return Form(
          child: Column(
            children: [
              CustomTextField(
                hintText: 'New Password',
                obscureText: cubit.obscureText,
                onChanged: (password) => cubit.password = password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: () => cubit.obscurePasswordText(),
                  icon: Icon(cubit.obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                ),
              ),
              const SizedBox(height: 30),
              state is NewPasswordLoading
                  ? const CircularProgressIndicator()
                  : CustomBtn(
                      text: 'Reset Password',
                      onPressed: () {
                        cubit.resetPassword(cubit.password!);
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
