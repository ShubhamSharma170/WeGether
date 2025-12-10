class UserModel {
  String? displayName;
  String? email;
  String? phoneNumber;
  String? uid;
  String? userName;

  UserModel({
    required this.displayName,
    required this.email,
    required this.phoneNumber,
    required this.uid,
    required this.userName,
  });

  UserModel.fromMap(Map<String, dynamic> map) {
    displayName = map['displayName'];
    email = map['email'];
    phoneNumber = map['phoneNumber'];
    uid = map['uid'];
    userName = map['userName'];
  }

  Map<String, dynamic> toMap() {
    return {
      "displayName": displayName,
      "email": email,
      "phoneNumber": phoneNumber,
      "uid": uid,
      "userName": userName,
    };
  }
}
