class Message {
  List<String>? keys;
  List<String>? message;
  String? signature;
  int? timestamp;

  Message({this.keys, this.message, this.signature, this.timestamp});

  Message.fromJson(Map<String, dynamic> json) {
    keys = json['keys'].cast<String>();
    message = json['message'].cast<String>();
    signature = json['signature'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['keys'] = keys;
    data['message'] = message;
    data['signature'] = signature;
    data['timestamp'] = timestamp;
    return data;
  }
}
