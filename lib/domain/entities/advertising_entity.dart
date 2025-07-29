class AdvertisingEntity {
  int? id;
  String imgUrl;
  String? externalUrl;
  bool status;
  DateTime createdAt;
  int? courseId;

  AdvertisingEntity({
    this.id,
    required this.imgUrl,
    this.externalUrl,
    required this.status,
    required this.createdAt,
    this.courseId,
  });
}
