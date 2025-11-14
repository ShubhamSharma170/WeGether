import 'package:chat_app/firebase_functions/display_name_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DisplayNameProvider with ChangeNotifier {
  bool isLoading = false;
  String displayName = FirebaseAuth.instance.currentUser?.displayName ?? "";

  Future<String?> updateDisplayName(String newName) async {
    String? errorMsg;
    if (newName.trim().isEmpty) {
      return "Display name cannot be empty";
    }
    isLoading = true;
    notifyListeners();
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        if (user.displayName == newName.trim()) {
          return "Try a different name";
        }
        await user.updateDisplayName(newName.trim());
        await user.reload();
        await DisplayNameStoreInFirebase.saveDisplayName(newName, user.uid);
        return "Display name updated successfully";
      }
    } on FirebaseException catch (e) {
      errorMsg = e.message ?? "An error occurred while updating display name";
    } catch (e) {
      errorMsg = "An unexpected error occurred";
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return errorMsg;
  }
}
