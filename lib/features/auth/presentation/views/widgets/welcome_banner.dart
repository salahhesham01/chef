import 'package:flutter/material.dart';

import '../../../../../core/utils/assets/app_assets.dart';
import '../../../../../core/utils/text_style.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
            aspectRatio: 3.5 / 2.3,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppAssets.bk), fit: BoxFit.fill)),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 92),
          child: Center(
            child: Text(
              "Welcome Back",
              style: TextStyles.latoTextStyle36Bold
                  .copyWith(fontSize: 32, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
