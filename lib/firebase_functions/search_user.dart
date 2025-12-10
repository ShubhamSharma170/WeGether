import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class SearchUserFunction {
  static Future<void> searchUser(String data) async {
    await FirebaseFirestore.instance
        .collection("users")
        .get()
        .then(
          (value) => value.docs.forEach((element) {
            log(element.data()['gmail'].toString());
            // if()
          }),
        );
  }
}
