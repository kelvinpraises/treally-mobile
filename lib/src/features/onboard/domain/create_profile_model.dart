import 'dart:convert';

class CreateProfileModel {
  CreateProfileModel({
    required this.name,
    required this.description,
  });

  final String name;
  final String description;

  CreateProfileModel copyWith({
    String? name,
    String? description,
  }) {
    return CreateProfileModel(
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
    };
  }

  factory CreateProfileModel.fromMap(Map<String, dynamic> map) {
    return CreateProfileModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateProfileModel.fromJson(String source) =>
      CreateProfileModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CreateProfileModel(name: $name, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateProfileModel &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode;
}
