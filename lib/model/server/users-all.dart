class UserAll {
  int id;
  String name;
  String email;
  String phone;
  int cityId;
  String userableType;
  int userableId;
  DateTime createdAt;
  DateTime updatedAt;
  Userable userable;
  City city;

  UserAll({
    this.id = 0,
    this.name = '',
    this.email = '',
    this.phone = '',
    this.cityId = 0,
    this.userableType = '',
    this.userableId = 0,
    DateTime? createdAt,
    DateTime? updatedAt,
    Userable? userable,
    City? city,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now(),
        userable = userable ?? Userable(),
        city = city ?? City();

  factory UserAll.fromJson(Map<String, dynamic> json) {
    return UserAll(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      cityId: json['city_id'] ?? 0,
      userableType: json['userable_type'] ?? '',
      userableId: json['userable_id'] ?? 0,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : DateTime.now(),
      userable: json['userable'] != null ? Userable.fromJson(json['userable']) : Userable(),
      city: json['city'] != null ? City.fromJson(json['city']) : City(),
    );
  }
}

class Userable {
  int id;
  String location;
  String commercialNumber;
  String personalIdNumber;
  String accountStatus;
  DateTime createdAt;
  DateTime updatedAt;

  Userable({
    this.id = 0,
    this.location = '',
    this.commercialNumber = '',
    this.personalIdNumber = '',
    this.accountStatus = '',
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Userable.fromJson(Map<String, dynamic> json) {
    return Userable(
      id: json['id'] ?? 0,
      location: json['location'] ?? '',
      commercialNumber: json['commercial_number'] ?? '',
      personalIdNumber: json['personal_id_number'] ?? '',
      accountStatus: json['account_status'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : DateTime.now(),
    );
  }
}

class City {
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  City({
    this.id = 0,
    this.name = '',
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : DateTime.now(),
    );
  }
}
