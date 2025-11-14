import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/textfield.dart';
import 'package:flutter/material.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({super.key});

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Phone Number")),
      body: Center(
        child: Column(
          children: [
            MyTextField(hintText: "Enter Phone Number", controller: controller),
            SizedBox(height: 20),
            MyButton(buttonName: "Save", onTap: () async {}),
          ],
        ),
      ),
    );
  }
}
