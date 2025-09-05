import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../text_style.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        height: 42,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Text(
            text,
            style: TextStyles.poppinsTextStyle24Bold,
          ),
        ),
      ),
    );
  }
}
