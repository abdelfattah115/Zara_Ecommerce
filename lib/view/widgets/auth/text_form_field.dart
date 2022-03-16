import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function validator;
  final String text;
  final bool obscureText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final TextInputType keyboardType;

  AuthTextFormField(
      {required this.controller,
      required this.validator,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.obscureText,
      required this.text,
      required this.keyboardType,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      validator: (value) => validator(value),
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        hintText: text,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black45,
        ),
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
