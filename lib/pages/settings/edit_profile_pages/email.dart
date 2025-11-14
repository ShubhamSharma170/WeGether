import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final TextEditingController _emailController = TextEditingController();
  late User _user;
  @override
  void initState() {
    _user = FirebaseAuth.instance.currentUser!;
    _emailController.text = _user.email!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Email")),
      body: Center(
        child: Column(
          children: [
            MyTextField(hintText: "Enter Email", controller: _emailController),
            SizedBox(height: 20),
            MyButton(buttonName: "Save", onTap: () async {}),
          ],
        ),
      ),
    );
  }
}
