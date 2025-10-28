import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final bool obscureText;
  final String? hintText;
  final TextEditingController? controller;
  const MyTextField({
    super.key,
    this.obscureText = false,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color.tertiary),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color.primary),
        ),
        fillColor: color.tertiary,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: color.primary),
      ),
    );
  }
}
