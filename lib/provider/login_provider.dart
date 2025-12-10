import 'dart:developer';

import 'package:chat_app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  String errorMessage = "";
  // function for validate email and password
  bool validateLogin(String email, String password) {
    if (email.isEmpty || !email.contains("@") || !email.contains(".com")) {
      errorMessage = "Please enter a valid email address.";
      notifyListeners();
      return false;
    } else if (password.isEmpty || password.length < 6) {
      errorMessage = "Password must be at least 6 characters long.";
      notifyListeners();
      return false;
    } else {
      errorMessage = "";
      notifyListeners();
      return true;
    }
  }

  // function for login user
  Future<String?> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // User logged in successfully
      if (userCredential.user != null) {
      DocumentSnapshot snapshot = await  FirebaseFirestore.instance.collection("users").doc(userCredential.user!.uid).get();
      UserModel model = UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
        log("User Details : ${userCredential.user}");
        return null;
      } else {
        return "Login failed.";
      }
    } on FirebaseException catch (e) {
      log("FirebaseException: ${e.message}");
      return e.code;
    } catch (e) {
      log("Exception: $e");
      return "An unexpected error occurred.";
    }
  }
}
