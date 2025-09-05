import 'package:chef/features/profile/presentation/view/widgets/edit_profile_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Edit Profile',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: primaryColor,
        ),
        body: const EditProfileViewBody(),
      ),
    );
  }
}
