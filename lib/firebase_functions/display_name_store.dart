import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class DisplayNameStoreInFirebase {
  static Future<void> saveDisplayName(String displayName, String uid) async {
    try {
      await FirebaseFirestore.instance.collection("users").doc(uid).update({
        "displayName": displayName,
      });
      log(
        "Display name saved to Firestore for UID: $uid and name: $displayName",
      );
    } on FirebaseException catch (e) {
      log("FirebaseException while saving display name: ${e.message}");
      throw e;
    } catch (e) {
      log("Unexpected error while saving display name: $e");
      rethrow;
    }
  }
}
