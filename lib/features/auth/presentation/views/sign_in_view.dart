import 'package:chef/features/auth/presentation/views/widgets/sign_in_body.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SignInBody(),
      ),
    );
  }
}
