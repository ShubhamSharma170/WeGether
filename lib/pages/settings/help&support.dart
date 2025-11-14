// ignore_for_file: file_names

import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/textfield.dart';
import 'package:flutter/material.dart';

class HelpAndSupportPage extends StatefulWidget {
  const HelpAndSupportPage({super.key});

  @override
  State<HelpAndSupportPage> createState() => _HelpAndSupportPageState();
}

class _HelpAndSupportPageState extends State<HelpAndSupportPage> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Help & Support")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  "How can we help you?",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                MyTextField(hintText: "Enter Query", controller: controller),
                SizedBox(height: 20),
                MyButton(buttonName: "Send", onTap: () async {}),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                "We'll get back to you as soon as possible!",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
