import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final void Function()? onTap;
  const MyButton({super.key, required this.buttonName, this.onTap});
  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.tertiary,
          borderRadius: BorderRadius.circular(12),
          // border: Border.all(color: color.primary),
        ),
        margin: EdgeInsets.symmetric(horizontal: 60),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(color: color.primary, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
