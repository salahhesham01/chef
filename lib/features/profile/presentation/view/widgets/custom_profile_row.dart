import 'package:flutter/material.dart';

import '../../../../../core/utils/text_style.dart';

class CustomProfileRow extends StatelessWidget {
  const CustomProfileRow({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.color,
  });
  final icon;
  final String text;
  final void Function()? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: color ?? Colors.black,
          ),
          TextButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: TextStyles.urbanistTextStyle17SemiBold
                    .copyWith(color: color ?? Colors.black),
              )),
        ],
      ),
    );
  }
}
