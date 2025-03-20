import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconData? icon;
  final IconButton? prefixIcon;
  final Color? fillColor;
  final Color? textColor;
  final String? hintText;

  final Function()? onPressSuffix;
  final bool? obscureText;
  final Function(String)? onChanged;

  const CustomTextFeild(
      {super.key,
      this.labelText,
      this.controller,
      this.validator,
      this.icon,
      this.onPressSuffix,
      this.obscureText,
      this.prefixIcon,
      this.fillColor,
      this.textColor,
      this.hintText,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          fillColor: fillColor,
          filled: true,
          prefixIcon: prefixIcon,
          suffixIcon: IconButton(onPressed: onPressSuffix, icon: Icon(icon)),
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(color: textColor),
          border: const OutlineInputBorder(borderSide: BorderSide.none)),
    );
  }
}
