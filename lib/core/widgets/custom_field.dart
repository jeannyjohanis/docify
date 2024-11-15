import 'package:flutter/material.dart';
import 'package:docify/gen/fonts.gen.dart';

abstract class CustomField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? onFieldSubmitted;
  final String? hint;
  final String? title;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const CustomField({
    super.key,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.hint,
    this.title,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context);
}

class CustomTextField extends CustomField {
  const CustomTextField({
    super.key,
    super.hint,
    super.title,
    super.suffixIcon,
    super.prefixIcon,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontFamily: FontFamily.poppins,
        ),
        border: InputBorder.none,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        focusColor: Colors.white,
      ),
    );
  }
}
