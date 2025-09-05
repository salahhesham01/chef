import 'package:chef/features/profile/presentation/view/widgets/change_password_body.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Password',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
      ),
      body: const ChangePasswordBody(),
    ));
  }
}
