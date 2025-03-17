import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData? icon;
  final Function()? onPressSuffix;
  final bool? obscureText;
  const CustomTextFeild(
      {super.key,
      required this.labelText,
      required this.controller,
      this.validator,
      this.icon,
      this.onPressSuffix,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: IconButton(onPressed: onPressSuffix, icon: Icon(icon)),
          labelText: labelText,
          border: const OutlineInputBorder()),
    );
  }
}
