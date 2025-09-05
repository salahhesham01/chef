import 'package:chef/core/utils/text_style.dart';
import 'package:chef/core/utils/widgets/custom_btn.dart';
import 'package:chef/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets/app_assets.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
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
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  textAlign: TextAlign.center,
                  'Enter Your mail and we will send you email to rest your password',
                  style: TextStyles.latoTextStyle36Bold
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              CustomTextField(hintText: 'E-mail'),
              const SizedBox(
                height: 30,
              ),
              CustomBtn(text: 'Send E-mail', onPressed: () {}),
            ],
          ),
        )
      ],
    );
  }
}
