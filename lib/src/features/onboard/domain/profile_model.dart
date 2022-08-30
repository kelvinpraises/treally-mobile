import 'dart:convert';

class ProfileModel {
  const ProfileModel({
    required this.universalProfile,
    required this.privateKey,
  });

  final String universalProfile;
  final String privateKey;

  ProfileModel copyWith({
    String? universalProfile,
    String? privateKey,
  }) {
    return ProfileModel(
      universalProfile: universalProfile ?? this.universalProfile,
      privateKey: privateKey ?? this.privateKey,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'universalProfile': universalProfile,
      'privateKey': privateKey,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      universalProfile: map['universalProfile'] ?? '',
      privateKey: map['privateKey'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProfileModel(universalProfile: $universalProfile, privateKey: $privateKey)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileModel &&
        other.universalProfile == universalProfile &&
        other.privateKey == privateKey;
  }

  @override
  int get hashCode => universalProfile.hashCode ^ privateKey.hashCode;
}
