import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key, required this.hintText, this.suffixIcon, this.obscureText});
  final String hintText;
  bool? obscureText = true;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        decoration: InputDecoration(
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            hintText: hintText,
            suffixIcon: suffixIcon),
        obscureText: obscureText ?? false,
        validator: (value) {
          if (value!.isEmpty) {
            return "this field is required";
          } else {
            return null;
          }
        },
      ),
    );
  }
}

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xff9D9FA0)),
    borderRadius: BorderRadius.circular(8),
  );
}
