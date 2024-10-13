class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final DateTime emailVerifiedAt;
  final int cityId;
  final String userableType;
  final int userableId;
  final String? avatar; // Nullable
  final DateTime createdAt;
  final DateTime updatedAt;
  final Userable userable;
  final City city;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.emailVerifiedAt,
    required this.cityId,
    required this.userableType,
    required this.userableId,
    this.avatar, // Optional
    required this.createdAt,
    required this.updatedAt,
    required this.userable,
    required this.city,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      emailVerifiedAt: DateTime.parse(json['email_verified_at']),
      cityId: json['city_id'],
      userableType: json['userable_type'],
      userableId: json['userable_id'],
      avatar: json['avatar'] ?? 'default_avatar.png',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      userable: Userable.fromJson(json['userable']),
      city: City.fromJson(json['city']),
    );
  }
}

class Userable {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;

  Userable({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Userable.fromJson(Map<String, dynamic> json) {
    return Userable(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class City {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  City({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
