import 'package:chat_app/components/button.dart';
import 'package:flutter/material.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile Photo")),
      body: const Center(
        child: Column(
          children: [
            CircleAvatar(radius: 80),
            SizedBox(height: 20),
            MyButton(buttonName: "Edit Photo"),
          ],
        ),
      ),
    );
  }
}
