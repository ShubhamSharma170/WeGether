import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit User Name"),
      ),
      body: const Center(
        child: Text("User Name Edit Page"),
      ),
    );
  }
}