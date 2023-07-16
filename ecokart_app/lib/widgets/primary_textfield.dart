import 'package:flutter/material.dart';
import '/utils/app_theme.dart';

class PrimaryTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String? initialValue;
  final Function(String)? onChanged;

  const PrimaryTextField({
    super.key,
    required this.labelText,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.initialValue,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkGreen,
          ),
          borderRadius: BorderRadius.circular(7)
        ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.darkGreen,
              ),
              borderRadius: BorderRadius.circular(7)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(7)
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(7)
          ),
        labelText: labelText
      ),
    );
  }
}
