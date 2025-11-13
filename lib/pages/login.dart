import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/notification_bar.dart';
import 'package:chat_app/components/textfield.dart';
import 'package:chat_app/pages/home.dart';
import 'package:chat_app/pages/register.dart';
import 'package:chat_app/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    ColorScheme color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
      body: ChangeNotifierProvider<LoginProvider>(
        create: (ctx) => LoginProvider(),
        builder: (ctx, child) => Consumer<LoginProvider>(
          builder: (ctx, provider, child) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.message, size: 40, color: color.primary),
                  SizedBox(height: 30),
                  Text(
                    "Happy To See You Again!",
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
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: color.primary,
                    ),
                  ),

                  SizedBox(height: 10),
                  MyTextField(
                    hintText: "Enter your email",
                    controller: emailController,
                  ),
                  SizedBox(height: 10),
                  MyTextField(
                    hintText: "Enter your password",
                    obscureText: true,
                    controller: passwordController,
                  ),
                  SizedBox(height: 20),
                  MyButton(
                    buttonName: "Login",
                    onTap: () async {
                      bool isValid = provider.validateLogin(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                      if (isValid) {
                        String? result = await provider.loginUser(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                        if (!ctx.mounted) return;
                        if (result == null) {
                          NotificationBar.showSnackBar(ctx, "Login successful");
                          Navigator.pushAndRemoveUntil(
                            ctx,
                            MaterialPageRoute(builder: (ctx) => HomePage()),
                            (route) => false,
                          );
                        } else {
                          NotificationBar.showSnackBar(ctx, result);
                        }
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member?",
                        style: TextStyle(fontSize: 16, color: color.primary),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegisterPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Register now",
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
        ),
      ),
    );
  }
}
