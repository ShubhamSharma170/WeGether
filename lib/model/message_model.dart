class MessageModel {
  String? sender;
  DateTime? createdOn;
  bool? seen;
  String? text;

  MessageModel({this.sender, this.createdOn, this.seen, this.text});

  MessageModel.fromMap(Map<String, dynamic> map) {
    sender = map['sender'];
    createdOn = map['createdOn'].toDate();
    seen = map['seen'];
    text = map['text'];
  }
  Map<String, dynamic> toMap() {
    return {
      "sender": sender,
      "createdOn": createdOn,
      "seen": seen,
      "text": text,
    };
  }
}
