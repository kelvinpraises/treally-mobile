import 'dart:convert';

class OrbitDbChatRepo {
  const OrbitDbChatRepo({
    this.mine,
    this.contact,
  });

  final String? mine;
  final String? contact;


  OrbitDbChatRepo copyWith({
    String? mine,
    String? contact,
  }) {
    return OrbitDbChatRepo(
      mine: mine ?? this.mine,
      contact: contact ?? this.contact,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mine': mine,
      'contact': contact,
    };
  }

  factory OrbitDbChatRepo.fromMap(Map<String, dynamic> map) {
    return OrbitDbChatRepo(
      mine: map['mine'],
      contact: map['contact'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrbitDbChatRepo.fromJson(String source) => OrbitDbChatRepo.fromMap(json.decode(source));

  @override
  String toString() => 'OrbitDbChatRepo(mine: $mine, contact: $contact)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OrbitDbChatRepo &&
      other.mine == mine &&
      other.contact == contact;
  }

  @override
  int get hashCode => mine.hashCode ^ contact.hashCode;
}
