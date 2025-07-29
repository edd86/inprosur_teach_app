class StudentEntity {
  int? id;
  String name;
  String phone;
  String address;
  String? fingerprint;
  int userId;
  DateTime? createdAt;

  StudentEntity({
    this.id,
    required this.name,
    required this.phone,
    required this.address,
    this.fingerprint,
    required this.userId,
    this.createdAt,
  });
}
