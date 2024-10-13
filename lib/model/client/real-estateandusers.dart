class RealEstateAll {
  int id;
  int cityId;
  String description;
  String boundaries;
  String location;
  double price;
  String status;
  String commercialNumber;
  String realEstateableType;
  int realEstateableId;
  RealEstateable realEstateable;
  List<Feature> features;
  List<Attachment> attachments;
  Advertisement advertisement;

  RealEstateAll({
    required this.id,
    required this.cityId,
    required this.description,
    required this.boundaries,
    required this.location,
    required this.price,
    required this.status,
    required this.commercialNumber,
    required this.realEstateableType,
    required this.realEstateableId,
    required this.realEstateable,
    required this.features,
    required this.attachments,
    required this.advertisement,
  });

  // تحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'city_id': cityId,
      'description': description,
      'boundaries': boundaries,
      'location': location,
      'price': price,
      'status': status,
      'commercial_number': commercialNumber,
      'real_estateable_type': realEstateableType,
      'real_estateable_id': realEstateableId,
      'real_estateable': realEstateable.toJson(),
      'features': features.map((feature) => feature.toJson()).toList(),
      'attachments': attachments.map((attachment) => attachment.toJson()).toList(),
      'advertisement': advertisement.toJson(),
    };
  }
}

class RealEstateable {
  int id;
  int water;
  int electricity;
  int sewage;
  int gas;

  RealEstateable({
    required this.id,
    required this.water,
    required this.electricity,
    required this.sewage,
    required this.gas,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'water': water,
      'electricity': electricity,
      'sewage': sewage,
      'gas': gas,
    };
  }
}

class Feature {
  int id;
  String name;

  Feature({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Attachment {
  int id;
  String filePath;
  String fileType;
  int attachableId;
  String attachableType;

  Attachment({
    required this.id,
    required this.filePath,
    required this.fileType,
    required this.attachableId,
    required this.attachableType,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'file_path': filePath,
      'file_type': fileType,
      'attachable_id': attachableId,
      'attachable_type': attachableType,
    };
  }
}
class Advertisement {
  int id;
  String title;
  int viewsCount;
  int sharesCount;
  int likesCount;
  String status;
  int providerId;

  Advertisement({
    required this.id,
    required this.title,
    required this.viewsCount,
    required this.sharesCount,
    required this.likesCount,
    required this.status,
    required this.providerId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'views_count': viewsCount,
      'shares_count': sharesCount,
      'likes_count': likesCount,
      'status': status,
      'provider_id': providerId,
    };
  }
}
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'city_id': cityId,
      'userable_type': userableType,
      'userable_id': userableId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'userable': userable.toJson(),
      'city': city.toJson(),
    };
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'location': location,
      'commercial_number': commercialNumber,
      'personal_id_number': personalIdNumber,
      'account_status': accountStatus,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
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
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
