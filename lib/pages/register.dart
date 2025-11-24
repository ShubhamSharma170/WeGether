import 'dart:developer';

import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/notification_bar.dart';
import 'package:chat_app/components/textfield.dart';
import 'package:chat_app/firebase_functions/save_user_detail.dart';
import 'package:chat_app/pages/home.dart';
import 'package:chat_app/provider/register_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        child: ChangeNotifierProvider(
          create: (ctx) => RegisterPageProvider(),
          builder: (ctx, child) => Consumer<RegisterPageProvider>(
            builder: (ctx, provider, child) {
              return Center(
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
                    Text(
                      provider.errorMessage,
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
                    MyButton(
                      buttonName: "Register",
                      onTap: () async {
                        // log("Register button pressed");

                        bool isValid = provider.validateRegister(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                          cPasswordController.text.trim(),
                        );
                        if (isValid) {
                          String? isCreated = await provider.createUser(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                          if (isCreated == null) {
                            log("User created successfully");
                            if (!ctx.mounted) return;
                            NotificationBar.showSnackBar(
                              ctx,
                              "User created successfully",
                            );
                            SaveUserDetail.saveUserDetails(
                              FirebaseAuth.instance.currentUser!.uid,
                            );
                            // navigate to home page
                            Navigator.pushAndRemoveUntil(
                              ctx,
                              MaterialPageRoute(builder: (ctx) => HomePage()),
                              (route) => false,
                            );
                          } else {
                            log("User creation failed: $isCreated");
                            if (!ctx.mounted) return;
                            NotificationBar.showSnackBar(ctx, isCreated);
                          }
                        }
                      }, 
                    ),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
