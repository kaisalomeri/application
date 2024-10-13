class RealEstateApartment {
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
  DateTime createdAt;
  DateTime updatedAt;
  RealEstateable realEstateable;
  List<Feature> features;
  List<Attachment> attachments;
  Advertisement advertisement;

  RealEstateApartment({
    this.id = 0,
    this.cityId = 0,
    this.description = '',
    this.boundaries = '',
    this.location = '',
    this.price = 0.0,
    this.status = '',
    this.commercialNumber = '',
    this.realEstateableType = '',
    this.realEstateableId = 0,
    DateTime? createdAt,
    DateTime? updatedAt,
    RealEstateable? realEstateable,
    List<Feature>? features,
    List<Attachment>? attachments,
    Advertisement? advertisement,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now(),
        realEstateable = realEstateable ?? RealEstateable(),
        features = features ?? [],
        attachments = attachments ?? [],
        advertisement = advertisement ?? Advertisement();

  factory RealEstateApartment.fromJson(Map<String, dynamic> json) {
    return RealEstateApartment(
      id: json['id'] ?? 0,
      cityId: json['city_id'] ?? 0,
      description: json['description'] ?? '',
      boundaries: json['boundaries'] ?? '',
      location: json['location'] ?? '',
      price: json['price']?.toDouble() ?? 0.0,
      status: json['status'] ?? '',
      commercialNumber: json['commercial_number'] ?? '',
      realEstateableType: json['real_estateable_type'] ?? '',
      realEstateableId: json['real_estateable_id'] ?? 0,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
      realEstateable: json['real_estateable'] != null
          ? RealEstateable.fromJson(json['real_estateable'])
          : RealEstateable(),
      features: (json['features'] as List<dynamic>?)
              ?.map((item) => Feature.fromJson(item))
              .toList() ??
          [],
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((item) => Attachment.fromJson(item))
              .toList() ??
          [],
      advertisement: json['advertisement'] != null
          ? Advertisement.fromJson(json['advertisement'])
          : Advertisement(),
    );
  }
}

class RealEstateable {
  int id;
  int water;
  int electricity;
  int sewage;
  int gas;
  DateTime createdAt;
  DateTime updatedAt;

  RealEstateable({
    this.id = 0,
    this.water = 0,
    this.electricity = 0,
    this.sewage = 0,
    this.gas = 0,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory RealEstateable.fromJson(Map<String, dynamic> json) {
    return RealEstateable(
      id: json['id'] ?? 0,
      water: json['water'] ?? 0,
      electricity: json['electricity'] ?? 0,
      sewage: json['sewage'] ?? 0,
      gas: json['gas'] ?? 0,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
    );
  }
}

class Feature {
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  Feature({
    this.id = 0,
    this.name = '',
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
    );
  }
}

class Attachment {
  final int id;
  final String filePath;
  final String fileType; // يمكنك إضافة هذه الخاصية إذا لزم الأمر
  final int attachableId; // للحقل attachable_id
  final String attachableType; // للحقل attachable_type

  // إضافة قيم افتراضية هنا
  Attachment({
    this.id = 0, // القيمة الافتراضية لـ id
    this.filePath = '', // القيمة الافتراضية لـ filePath
    this.fileType = 'application/octet-stream', // القيمة الافتراضية لـ fileType
    this.attachableId = 0, // القيمة الافتراضية لـ attachableId
    this.attachableType = 'Unknown', // القيمة الافتراضية لـ attachableType
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'] ?? 0, // استخدام القيمة الافتراضية إذا لم تكن موجودة
      filePath: json['file_path'] ??
          '', // استخدام القيمة الافتراضية إذا لم تكن موجودة
      fileType: json['file_type'] ??
          'application/octet-stream', // استخدام القيمة الافتراضية إذا لم تكن موجودة
      attachableId: json['attachable_id'] ??
          0, // استخدام القيمة الافتراضية إذا لم تكن موجودة
      attachableType: json['attachable_type'] ??
          'Unknown', // استخدام القيمة الافتراضية إذا لم تكن موجودة
    );
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
  DateTime createdAt;
  DateTime updatedAt;

  Advertisement({
    this.id = 0,
    this.title = '',
    this.viewsCount = 0,
    this.sharesCount = 0,
    this.likesCount = 0,
    this.status = '',
    this.providerId = 0,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Advertisement.fromJson(Map<String, dynamic> json) {
    return Advertisement(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      viewsCount: json['views_count'] ?? 0,
      sharesCount: json['shares_count'] ?? 0,
      likesCount: json['likes_count'] ?? 0,
      status: json['status'] ?? '',
      providerId: json['provider_id'] ?? 0,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
    );
  }
}

class UserApartment {
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

  UserApartment({
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

  factory UserApartment.fromJson(Map<String, dynamic> json) {
    return UserApartment(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      cityId: json['city_id'] ?? 0,
      userableType: json['userable_type'] ?? '',
      userableId: json['userable_id'] ?? 0,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
      userable: json['userable'] != null
          ? Userable.fromJson(json['userable'])
          : Userable(),
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
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
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
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
    );
  }
}
