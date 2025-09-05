import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/text_style.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.kForgetView);
          },
          child: Text(
            "forget password ?",
            style: TextStyles.latoTextStyle36Bold
                .copyWith(fontSize: 16, color: const Color(0xffB5B7B8)),
          ),
        ));
  }
}
