import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'message_model.dart';

class Chat {
  const Chat({
    required this.ownerUniversalProfile,
    required this.recipientUniversalProfile,
    this.messages,
  });

  final String ownerUniversalProfile;
  final String recipientUniversalProfile;
  final List<Message>? messages;

  Chat copyWith({
    String? ownerUniversalProfile,
    String? recipientUniversalProfile,
    List<Message>? messages,
  }) {
    return Chat(
      ownerUniversalProfile:
          ownerUniversalProfile ?? this.ownerUniversalProfile,
      recipientUniversalProfile:
          recipientUniversalProfile ?? this.recipientUniversalProfile,
      messages: messages ?? this.messages,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ownerUniversalProfile': ownerUniversalProfile,
      'recipientUniversalProfile': recipientUniversalProfile,
      'messages': messages?.map((x) => x.toMap()).toList(),
    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      ownerUniversalProfile: map['ownerUniversalProfile'] ?? '',
      recipientUniversalProfile: map['recipientUniversalProfile'] ?? '',
      messages: map['messages'] != null
          ? List<Message>.from(
              map['messages']?.map((x) => Message.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Chat.fromJson(String source) => Chat.fromMap(json.decode(source));

  @override
  String toString() =>
      'Chat(ownerUniversalProfile: $ownerUniversalProfile, recipientUniversalProfile: $recipientUniversalProfile, messages: $messages)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Chat &&
        other.ownerUniversalProfile == ownerUniversalProfile &&
        other.recipientUniversalProfile == recipientUniversalProfile &&
        listEquals(other.messages, messages);
  }

  @override
  int get hashCode =>
      ownerUniversalProfile.hashCode ^
      recipientUniversalProfile.hashCode ^
      messages.hashCode;
}
