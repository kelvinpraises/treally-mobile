import 'dart:convert';

class EncryptedMessage {
  const EncryptedMessage({
    required this.messageEncryptionKeys,
    required this.encryptedMessages,
    required this.encryptionMode,
    required this.timestamp,
  });

  final List<String> messageEncryptionKeys;
  final List<String> encryptedMessages;
  final String encryptionMode;
  final int timestamp;

  Map<String, dynamic> toMap() {
    return {
      'messageEncryptionKeys': messageEncryptionKeys,
      'encryptedMessages': encryptedMessages,
      'encryptionMode': encryptionMode,
      'timestamp': timestamp,
    };
  }

  factory EncryptedMessage.fromMap(Map<String, dynamic> map) {
    return EncryptedMessage(
      messageEncryptionKeys: List<String>.from(map['messageEncryptionKeys']),
      encryptedMessages: List<String>.from(map['encryptedMessages']),
      encryptionMode: map['encryptionMode'] ?? '',
      timestamp: map['timestamp']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory EncryptedMessage.fromJson(String source) =>
      EncryptedMessage.fromMap(json.decode(source));
}
