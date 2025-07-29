class StudentModel {
  int? id;
  String name;
  String phone;
  String address;
  String? fingerprint;
  int userId;
  DateTime? createdAt;

  StudentModel({
    this.id,
    required this.name,
    required this.phone,
    required this.address,
    this.fingerprint,
    required this.userId,
    this.createdAt,
  });

  factory StudentModel.fromMap(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'address': address,
      'fingerprint': fingerprint,
      'userId': userId,
    };
  }

  StudentModel copyWith({
    int? id,
    String? name,
    String? phone,
    String? address,
    String? fingerprint,
    int? userId,
    DateTime? createdAt,
  }) {
    return StudentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      fingerprint: fingerprint ?? this.fingerprint,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
