class RealEstate {
  final int id;
  final int cityId;
  final String description;
  final String boundaries;
  final String location;
  final double price;
  final String status;
  final String commercialNumber;
  final String realEstateableType;
  final int realEstateableId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int advertisementId;
  final RealEstateable realEstateable;
  final List<Feature> features;
  final List<Attachment> attachments;
  final Advertisement advertisement;

  RealEstate({
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
    required this.createdAt,
    required this.updatedAt,
    required this.advertisementId,
    required this.realEstateable,
    required this.features,
    required this.attachments,
    required this.advertisement,
  });

  factory RealEstate.fromJson(Map<String, dynamic> json) {
    var featuresList = json['features'] as List;
    var attachmentsList = json['attachments'] as List;

    return RealEstate(
      id: json['id'],
      cityId: json['city_id'],
      description: json['description'],
      boundaries: json['boundaries'],
      location: json['location'],
      price: json['price'].toDouble(),
      status: json['status'],
      commercialNumber: json['commercial_number'],
      realEstateableType: json['real_estateable_type'],
      realEstateableId: json['real_estateable_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      advertisementId: json['advertisement_id'],
      realEstateable: RealEstateable.fromJson(json['real_estateable']),
      features: featuresList.map((i) => Feature.fromJson(i)).toList(),
      attachments: attachmentsList.map((i) => Attachment.fromJson(i)).toList(),
      advertisement: Advertisement.fromJson(json['advertisement']),
    );
  }
}

class RealEstateable {
  final int id;
  final int floorsNumber;
  final int apartmentsCount;
  final int water;
  final int electricity;
  final int sewage;
  final int gas;
  final DateTime createdAt;
  final DateTime updatedAt;

  RealEstateable({
    required this.id,
    required this.gas,
    required this.electricity,
    required this.sewage,
    required this.water,
    this.floorsNumber = 0, // القيمة الافتراضية
    this.apartmentsCount = 0, // القيمة الافتراضية
    required this.createdAt,
    required this.updatedAt,
  });

  factory RealEstateable.fromJson(Map<String, dynamic> json) {
    return RealEstateable(
      id: json['id'] ?? 0, // القيمة الافتراضية
      floorsNumber: json['floors_number'] ?? 0,
      sewage: json['sewage'] ?? 0,
      water: json['water'] ?? 0, // القيمة الافتراضية

      electricity: json['electricity'] ?? 0, // القيمة الافتراضية

      gas: json['gas'] ?? 0, // القيمة الافتراضية
      // القيمة الافتراضية
// القيمة الافتراضية
      apartmentsCount: json['apartments_count'] ?? 0, // القيمة الافتراضية
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class Feature {
  final String name;

  Feature({
    this.name = 'غير متوفر', // القيمة الافتراضية
  });

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      name: json['name'] ?? 'غير متوفر',
    );
  }
}

class Attachment {
  final int id;
  final String filePath;
  final String fileType;
  final String attachableType;
  final int attachableId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Attachment({
    required this.id,
    this.filePath = 'غير متوفر', // القيمة الافتراضية
    this.fileType = 'غير متوفر', // القيمة الافتراضية
    required this.attachableType,
    required this.attachableId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'] ?? 0, // القيمة الافتراضية
      filePath: json['file_path'] ?? 'غير متوفر',
      fileType: json['file_type'] ?? 'غير متوفر',
      attachableType: json['attachable_type'] ?? '',
      attachableId: json['attachable_id'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class Advertisement {
  final int id; // معرف الإعلان
  final String title; // عنوان الإعلان
  final int viewsCount; // عدد المشاهدات
  final int sharesCount; // عدد المشاركات
  final double rating; // التقييم
  final int likesCount; // عدد الإعجابات
  final String status; // حالة الإعلان
  final int providerId; // معرف المزود
  final DateTime createdAt;
  final DateTime updatedAt;

  Advertisement({
    required this.id,
    this.title = 'غير متوفر', // القيمة الافتراضية
    this.viewsCount = 0, // القيمة الافتراضية
    this.sharesCount = 0, // القيمة الافتراضية
    this.rating = 0.0, // القيمة الافتراضية
    this.likesCount = 0, // القيمة الافتراضية
    this.status = 'غير متوفر', // القيمة الافتراضية
    required this.providerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Advertisement.fromJson(Map<String, dynamic> json) {
    return Advertisement(
      id: json['id'],
      title: json['title'] ?? 'غير متوفر', // القيمة الافتراضية
      viewsCount: json['views_count'] ?? 0, // القيمة الافتراضية
      sharesCount: json['shares_count'] ?? 0, // القيمة الافتراضية
      rating: json['rating']?.toDouble() ?? 0.0, // القيمة الافتراضية
      likesCount: json['likes_count'] ?? 0, // القيمة الافتراضية
      status: json['status'] ?? 'غير متوفر', // القيمة الافتراضية
      providerId: json['provider_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
