import "dart:developer";

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class RegisterPageProvider with ChangeNotifier {
  String errorMessage = "";

  // function for check email, password and confirm password validation
  bool validateRegister(String email, String password, String cPassword) {
    if (email.isEmpty || !email.contains("@") || !email.contains(".com")) {
      errorMessage = "Please enter a valid email address.";
      notifyListeners();
      return false;
    } else if (password.isEmpty || password.length < 6) {
      errorMessage = "Password must be at least 6 characters long.";
      notifyListeners();
      return false;
    } else if (password != cPassword) {
      errorMessage = "Passwords do not match.";
      notifyListeners();
      return false;
    } else {
      errorMessage = "";
      notifyListeners();
      return true;
    }
  }

  // function for create account
  Future<String?> createUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // when user is successfully created
      if (userCredential.user != null) {
        return null;
      } else {
        return "User creation failed.";
      }
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException: ${e.code}");
      return "${e.message}";
    } catch (e) {
      log("Exception: $e");
      return "An unexpected error occurred.";
    }
  }
}
