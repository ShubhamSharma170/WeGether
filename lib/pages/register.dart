import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController cPasswordController = TextEditingController();
    return Scaffold(
      backgroundColor: color.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.message, size: 40, color: color.primary),
              SizedBox(height: 30),
              Text(
                "Join Us Today",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: color.primary,
                ),
              ),
              SizedBox(height: 10),
              MyTextField(hintText: "Email", controller: emailController),
              SizedBox(height: 10),
              MyTextField(
                hintText: "Password",
                obscureText: true,
                controller: passwordController,
              ),
              SizedBox(height: 10),
              MyTextField(
                hintText: "Confirm Password",
                obscureText: true,
                controller: cPasswordController,
              ),
              SizedBox(height: 20),
              MyButton(buttonName: "Register"),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already a member?",
                    style: TextStyle(fontSize: 16, color: color.primary),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login now",
                      style: TextStyle(
                        fontSize: 16,
                        color: color.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
