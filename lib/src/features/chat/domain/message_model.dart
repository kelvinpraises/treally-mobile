import 'dart:convert';

class Message {
  const Message({
    required this.ownerUniversalProfile,
    required this.message,
    required this.timestamp,
  });

  final String ownerUniversalProfile;
  final String message;
  final int timestamp;

  Message copyWith({
    String? ownerUniversalProfile,
    String? message,
    int? timestamp,
  }) {
    return Message(
      ownerUniversalProfile:
          ownerUniversalProfile ?? this.ownerUniversalProfile,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ownerUniversalProfile': ownerUniversalProfile,
      'message': message,
      'timestamp': timestamp,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      ownerUniversalProfile: map['ownerUniversalProfile'] ?? '',
      message: map['message'] ?? '',
      timestamp: map['timestamp']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source));

  @override
  String toString() =>
      'Message(ownerUniversalProfile: $ownerUniversalProfile, message: $message, timestamp: $timestamp)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Message &&
        other.ownerUniversalProfile == ownerUniversalProfile &&
        other.message == message &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode =>
      ownerUniversalProfile.hashCode ^ message.hashCode ^ timestamp.hashCode;
}
