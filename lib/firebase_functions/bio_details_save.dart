// ignore_for_file: use_rethrow_when_possible

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class BioDetailsSave {
  static Future<void> saveBio(String uid, String bio) async {
    try {
      await FirebaseFirestore.instance.collection("bio").doc(uid).update({
        "bio": bio,
      });
    } on FirebaseException catch (e) {
      log(" FirebaseException while saving bio: ${e.code}");
    throw e;
    } catch (e) {
      log("Exception while saving bio: $e");
      throw e;
    }
  }
}
