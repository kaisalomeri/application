class Advertisement {
  final int id;
  final String title;
  final int viewsCount;
  final int sharesCount;
  final int likesCount;
  final String status;
  final int providerId;
  final RealEstate realEstate;

  Advertisement({
    required this.id,
    required this.title,
    required this.viewsCount,
    required this.sharesCount,
    required this.likesCount,
    required this.status,
    required this.providerId,
    required this.realEstate,
  });

  factory Advertisement.fromJson(Map<String, dynamic> json) {
    return Advertisement(
      id: json['id'],
      title: json['title'],
      viewsCount: json['views_count'],
      sharesCount: json['shares_count'],
      likesCount: json['likes_count'],
      status: json['status'],
      providerId: json['provider_id'],
      realEstate: RealEstate.fromJson(json['real_estate']),
    );
  }
}

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
  final String createdAt;
  final String updatedAt;
  final int advertisementId;
  final List<Attachment> attachments;

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
    required this.attachments,
  });

  factory RealEstate.fromJson(Map<String, dynamic> json) {
    var attachmentsList = json['attachments'] as List;
    List<Attachment> attachments =
        attachmentsList.map((i) => Attachment.fromJson(i)).toList();

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
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      advertisementId: json['advertisement_id'],
      attachments: attachments,
    );
  }
}

class Attachment {
  final int id;
  final String filePath;
  final String fileType;
  final String attachableType;
  final int attachableId;
  final String createdAt;
  final String updatedAt;

  Attachment({
    required this.id,
    required this.filePath,
    required this.fileType,
    required this.attachableType,
    required this.attachableId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'],
      filePath: json['file_path'],
      fileType: json['file_type'],
      attachableType: json['attachable_type'],
      attachableId: json['attachable_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
