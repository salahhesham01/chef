import 'package:chef/constants.dart';
import 'package:chef/features/auth/presentation/views/widgets/forget_password_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Forget Password',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: primaryColor,
        ),
        body: const ForgetPasswordBody(),
      ),
    );
  }
}
