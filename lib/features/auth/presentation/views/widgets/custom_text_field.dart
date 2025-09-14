import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      this.obscureText,
      this.validator,
      this.onChanged});
  final String hintText;
  bool? obscureText = true;
  Widget? suffixIcon;
  final validator;
  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
          onChanged: onChanged,
          decoration: InputDecoration(
              enabledBorder: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(),
              hintText: hintText,
              suffixIcon: suffixIcon),
          obscureText: obscureText ?? false,
          validator: validator),
    );
  }
}

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xff9D9FA0)),
    borderRadius: BorderRadius.circular(8),
  );
}
