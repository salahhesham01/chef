import 'package:chef/constants.dart';
import 'package:chef/features/auth/presentation/views/widgets/new_password.dart';
import 'package:flutter/material.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'New Password',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: primaryColor,
        ),
        body: const NewPassword(),
      ),
    );
  }
}
