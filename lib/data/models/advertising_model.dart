class AdvertisingModel {
  int? id;
  String imgUrl;
  String? externalUrl;
  bool status;
  DateTime createdAt;
  int? courseId;

  AdvertisingModel({
    this.id,
    required this.imgUrl,
    this.externalUrl,
    required this.status,
    required this.createdAt,
    this.courseId,
  });

  factory AdvertisingModel.fromMap(Map<String, dynamic> json) {
    return AdvertisingModel(
      id: json['id'],
      imgUrl: json['imgUrl'],
      externalUrl: json['externalUrl'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      courseId: json['courseId'],
    );
  }
}
