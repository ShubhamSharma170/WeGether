import 'dart:developer';

import 'package:chat_app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SaveUserDetail {
  static Future<void> saveUserDetails(String uid) async {
    User? user = FirebaseAuth.instance.currentUser;
    UserModel userModel = UserModel(
      uid: uid,
      userName: "",
      displayName: "",
      phoneNumber: "",
      gmail: user?.email ?? "",
    );
    if (user != null) {
      await FirebaseFirestore.instance.collection("users").doc(uid).set(
      //   {
      //   "uid": uid,
      //   "userName": "",
      //   "displayName": "",
      //   "phoneNumber": "",
      //   "gmail": user.email,
      //   "createdAt": FieldValue.serverTimestamp(),
      // }
      userModel.toMap()
      );
    }
    log("User details saved for UID: $uid");
  }
}
