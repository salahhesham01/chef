import 'package:chef/constants.dart';
import 'package:chef/core/utils/app_routes.dart';
import 'package:chef/core/utils/assets/app_assets.dart';
import 'package:chef/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToLang();
  }

  void navigateToLang() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).pushReplacement(AppRoutes.kSingInView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.logo,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Chef App',
              style: TextStyles.latoTextStyle36Bold,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
