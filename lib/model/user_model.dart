class UserModel {
  String? displayName;
  String? gmail;
  String? phoneNumber;
  String? uid;
  String? userName;

  UserModel({
    required this.displayName,
    required this.gmail,
    required this.phoneNumber,
    required this.uid,
    required this.userName,
  });

  UserModel.fromMap(Map<String, dynamic> map) {
    displayName = map['displayName'];
    gmail = map['gmail'];
    phoneNumber = map['phoneNumber'];
    uid = map['uid'];
    userName = map['userName'];
  }

  Map<String, dynamic> toMap() {
    return {
      "displayName": displayName,
      "gmail": gmail,
      "phoneNumber": phoneNumber,
      "uid": uid,
      "userName": userName,
    };
  }
}
