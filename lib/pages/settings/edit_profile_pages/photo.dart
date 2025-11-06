import 'package:flutter/material.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile Photo"),
      ),
      body: const Center(
        child: Text("User Photo Edit Page"),
      ),
    );
  }
}