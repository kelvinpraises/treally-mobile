class Message {
  List<String>? messageEncryptionKeys;
  List<String>? encryptedMessages;
  String? signature;
  int? timestamp;

  Message({
    this.messageEncryptionKeys,
    this.encryptedMessages,
    this.signature,
    this.timestamp,
  });

  Message.fromJson(Map<String, dynamic> json) {
    messageEncryptionKeys = json['messageEncryptionKeys'].cast<String>();
    encryptedMessages = json['encryptedMessages'].cast<String>();
    signature = json['signature'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['messageEncryptionKeys'] = messageEncryptionKeys;
    data['encryptedMessages'] = encryptedMessages;
    data['signature'] = signature;
    data['timestamp'] = timestamp;
    return data;
  }
}
