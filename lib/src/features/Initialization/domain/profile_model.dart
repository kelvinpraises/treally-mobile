import 'dart:convert';

class ProfileModel {
  const ProfileModel({
    required this.universalProfileAddress,
    required this.privateEOA,
  });

  final String universalProfileAddress;
  final String privateEOA;

  ProfileModel copyWith({
    String? universalProfileAddress,
    String? privateEOA,
  }) {
    return ProfileModel(
      universalProfileAddress:
          universalProfileAddress ?? this.universalProfileAddress,
      privateEOA: privateEOA ?? this.privateEOA,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'universalProfileAddress': universalProfileAddress,
      'privateEOA': privateEOA,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      universalProfileAddress: map['universalProfileAddress'] ?? '',
      privateEOA: map['privateEOA'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProfileModel(universalProfileAddress: $universalProfileAddress, privateEOA: $privateEOA)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileModel &&
        other.universalProfileAddress == universalProfileAddress &&
        other.privateEOA == privateEOA;
  }

  @override
  int get hashCode => universalProfileAddress.hashCode ^ privateEOA.hashCode;
}
