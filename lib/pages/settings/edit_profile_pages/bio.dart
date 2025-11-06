import 'package:flutter/material.dart';

class BioPage extends StatelessWidget {
  const BioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Bio"),
      ),
      body: const Center(
        child: Text("Bio Edit Page"),
      ),
    );
  }
}