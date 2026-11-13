import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final Widget prefix;
  final Widget? suffix;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;

  const InputField({
    super.key,
    required this.hintText,
    required this.prefix,
    this.suffix,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
    );
  }
}