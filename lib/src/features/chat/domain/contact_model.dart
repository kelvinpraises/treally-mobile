import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'orbit_db_chat_repo_model.dart';

class Contact {
  const Contact({
    required this.peerId,
    required this.myUniversalProfile,
    required this.contactUniversalProfile,
    this.messageEncryptionKeys,
    this.name,
    this.imageUrl,
    this.orbitDbChatRepo,
  });

  final String peerId;
  final String myUniversalProfile;
  final String contactUniversalProfile;
  final List<String>? messageEncryptionKeys;
  final String? name;
  final String? imageUrl;
  final OrbitDbChatRepo? orbitDbChatRepo;


  Contact copyWith({
    String? peerId,
    String? myUniversalProfile,
    String? contactUniversalProfile,
    List<String>? messageEncryptionKeys,
    String? name,
    String? imageUrl,
    OrbitDbChatRepo? orbitDbChatRepo,
  }) {
    return Contact(
      peerId: peerId ?? this.peerId,
      myUniversalProfile: myUniversalProfile ?? this.myUniversalProfile,
      contactUniversalProfile: contactUniversalProfile ?? this.contactUniversalProfile,
      messageEncryptionKeys: messageEncryptionKeys ?? this.messageEncryptionKeys,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      orbitDbChatRepo: orbitDbChatRepo ?? this.orbitDbChatRepo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'peerId': peerId,
      'myUniversalProfile': myUniversalProfile,
      'contactUniversalProfile': contactUniversalProfile,
      'messageEncryptionKeys': messageEncryptionKeys,
      'name': name,
      'imageUrl': imageUrl,
      'orbitDbChatRepo': orbitDbChatRepo?.toMap(),
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      peerId: map['peerId'] ?? '',
      myUniversalProfile: map['myUniversalProfile'] ?? '',
      contactUniversalProfile: map['contactUniversalProfile'] ?? '',
      messageEncryptionKeys: List<String>.from(map['messageEncryptionKeys']),
      name: map['name'],
      imageUrl: map['imageUrl'],
      orbitDbChatRepo: map['orbitDbChatRepo'] != null ? OrbitDbChatRepo.fromMap(map['orbitDbChatRepo']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) => Contact.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Contact(peerId: $peerId, myUniversalProfile: $myUniversalProfile, contactUniversalProfile: $contactUniversalProfile, messageEncryptionKeys: $messageEncryptionKeys, name: $name, imageUrl: $imageUrl, orbitDbChatRepo: $orbitDbChatRepo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Contact &&
      other.peerId == peerId &&
      other.myUniversalProfile == myUniversalProfile &&
      other.contactUniversalProfile == contactUniversalProfile &&
      listEquals(other.messageEncryptionKeys, messageEncryptionKeys) &&
      other.name == name &&
      other.imageUrl == imageUrl &&
      other.orbitDbChatRepo == orbitDbChatRepo;
  }

  @override
  int get hashCode {
    return peerId.hashCode ^
      myUniversalProfile.hashCode ^
      contactUniversalProfile.hashCode ^
      messageEncryptionKeys.hashCode ^
      name.hashCode ^
      imageUrl.hashCode ^
      orbitDbChatRepo.hashCode;
  }
}
