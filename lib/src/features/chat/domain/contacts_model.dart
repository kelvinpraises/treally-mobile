import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'contact_model.dart';

class Contacts {
  const Contacts({this.contact});

  final List<Contact>? contact;

  Contacts copyWith({
    List<Contact>? contact,
  }) {
    return Contacts(
      contact: contact ?? this.contact,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'contact': contact?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Contacts.fromMap(Map<String, dynamic> map) {
    return Contacts(
      contact: map['contact'] != null
          ? List<Contact>.from(map['contact']?.map((x) => Contact.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contacts.fromJson(String source) =>
      Contacts.fromMap(json.decode(source));

  @override
  String toString() => 'Contacts(contact: $contact)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Contacts && listEquals(other.contact, contact);
  }

  @override
  int get hashCode => contact.hashCode;
}
