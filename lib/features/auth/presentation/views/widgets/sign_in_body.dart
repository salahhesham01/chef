import 'package:chef/constants.dart';
import 'package:chef/core/utils/text_style.dart';
import 'package:chef/features/auth/presentation/views/cubit/sign_in/sing_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/widgets/custom_btn.dart';
import '../cubit/sign_in/sing_in_state.dart';
import 'custom_text_field.dart';
import 'forget_password.dart';
import 'welcome_banner.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeBanner(),
            const SizedBox(
              height: 90,
            ),
            CustomSignInForm(),
            const SizedBox(
              height: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account?',
                  style: TextStyles.poppinsTextStyle24Bold.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff7D8FAB)),
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  'Sign up',
                  style: TextStyles.poppinsTextStyle24Bold.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: primaryColor),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ],
        ))
      ],
    );
  }
}

class CustomSignInForm extends StatelessWidget {
  CustomSignInForm({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingInCubit, SingInState>(
      listener: (context, state) {
        if (state is SingInSuccess) {
          // Navigate to home
          GoRouter.of(context).pushReplacement(AppRoutes.kHomeView);
        } else if (state is SingInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMsg)),
          );
        }
      },
      builder: (context, state) {
        SingInCubit singInCubit = BlocProvider.of<SingInCubit>(context);
        return Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  hintText: 'E-mail',
                  onChanged: (email) => singInCubit.email = email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomTextField(
                  hintText: 'Password',
                  obscureText: singInCubit.obscureText,
                  onChanged: (password) => singInCubit.password = password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () => singInCubit.obscurePasswordText(),
                    icon: Icon(singInCubit.obscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const ForgetPassword(),
                const SizedBox(
                  height: 64,
                ),
                state is SingInLoading
                    ? const CircularProgressIndicator(
                        color: primaryColor,
                      )
                    : CustomBtn(
                        text: 'Sing in',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (singInCubit.email?.isNotEmpty == true &&
                                singInCubit.password?.isNotEmpty == true) {
                              singInCubit.signIn();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Please enter email and password")),
                              );
                            }
                          }
                        },
                      ),
              ],
            ));
      },
    );
  }
}
