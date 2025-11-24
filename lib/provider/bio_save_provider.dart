import 'package:flutter/material.dart';

class BioSaveProvider with ChangeNotifier {
  bool isLoading = false;
   SaveBio(String bio){
    if(bio.isEmpty){
      return "Bio cannot be empty";
    }
  }
}
