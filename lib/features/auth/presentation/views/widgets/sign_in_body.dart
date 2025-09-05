import 'package:chef/constants.dart';
import 'package:chef/core/utils/app_routes.dart';
import 'package:chef/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/widgets/custom_btn.dart';
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
            CustomTextField(
              hintText: 'E-mail',
            ),
            const SizedBox(
              height: 32,
            ),
            CustomTextField(
              hintText: 'Password',
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_off_outlined)),
            ),
            const SizedBox(
              height: 24,
            ),
            const ForgetPassword(),
            const SizedBox(
              height: 64,
            ),
            CustomBtn(
              text: 'Sing in',
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRoutes.kHomeView);
              },
            ),
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
