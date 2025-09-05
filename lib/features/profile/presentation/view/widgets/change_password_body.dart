import 'package:chef/core/utils/text_style.dart';
import 'package:chef/core/utils/widgets/custom_btn.dart';
import 'package:chef/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets/app_assets.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Change Password',
                  style: TextStyles.latoTextStyle36Bold
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                hintText: 'Old Password',
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_off_outlined)),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                hintText: 'New Password',
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_off_outlined)),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                hintText: 'Confirm New Password',
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_off_outlined)),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomBtn(text: 'Reset Password', onPressed: () {}),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        )
      ],
    );
  }
}
