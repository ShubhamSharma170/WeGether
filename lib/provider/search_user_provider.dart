import 'package:flutter/material.dart';

class SearchUserProvider with ChangeNotifier {
  String _searchEmail = ""; // Private variable

  String get searchEmail => _searchEmail; // Getter


  void setSearchEmail(String email) {
    _searchEmail = email.trim();
    notifyListeners();
  }
}
