// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final  Function(String)? onChanged;
  TextEditingController controller;
  CustomSearchBar({
    required this.controller,
    this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color.primary),
        ),
        hintText: 'Search...',
        prefixIcon: Icon(Icons.search, color: color.primary),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      onChanged: onChanged,
    );
  }
}
