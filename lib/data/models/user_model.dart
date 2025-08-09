class UserModel {
  int? id;
  String username;
  String email;
  String password;
  String? uId;
  DateTime? createdAt;
  String? photoUrl;
  bool? status;

  UserModel({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    this.uId,
    this.createdAt,
    this.photoUrl,
    this.status,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      uId: json['uId'],
      photoUrl: json['photo'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'photo': photoUrl,
      'status': status,
      'uId': uId,
    };
  }

  UserModel copyWith({
    int? id,
    String? username,
    String? email,
    String? password,
    String? photoUrl,
    bool? status,
    String? uId,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      photoUrl: photoUrl ?? this.photoUrl,
      status: status ?? this.status,
      uId: uId ?? this.uId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
