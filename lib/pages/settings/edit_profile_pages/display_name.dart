import 'package:flutter/material.dart';

class DisplayName extends StatelessWidget {
  const DisplayName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Display Name"),
      ),
      body: const Center(
        child: Text("Display Name Edit Page"),
      ),
    );
  }
}