import 'dart:async';
import 'package:chat_app/firebase_functions/firebase_helper.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  UserModel? userModel;
  User? firebaseAuth;
  @override
  void initState() {
    super.initState();
    getData();
    Timer(Duration(seconds: 2), () {
      if (mounted) {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteName.home,
            arguments: {
              "userModel": userModel,
              "firebaseAuth": firebaseAuth,
            },
            (route) => false,
          );
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteName.login,
            (route) => false,
          );
        }
      }
    });
  }

  void getData() async {
    userModel = await FirebaseHelper.getUserDetails(
      FirebaseAuth.instance.currentUser?.uid ?? "",
    );
    firebaseAuth = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat, size: 80, color: color.primary),
            SizedBox(height: 25),
            Text(
              "Welcome to WeGether",
              style: TextStyle(
                fontSize: 24,
                color: color.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
