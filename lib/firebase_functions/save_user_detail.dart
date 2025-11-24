import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SaveUserDetail {
  static Future<void> saveUserDetails(String uid) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection("users").doc(uid).set({
        "uid": uid,
        "userName": "",
        "displayName": "",
        "phoneNumber": "",
        "gmail": user.email,
        "createdAt": FieldValue.serverTimestamp(),
      });
    }
    log("User details saved for UID: $uid");
  }
}
