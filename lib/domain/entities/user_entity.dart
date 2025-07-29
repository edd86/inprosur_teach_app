class UserEntity {
  int? id;
  String username;
  String email;
  String password;
  String? uId;
  String? photoUrl;
  bool? status;
  DateTime? createdAt;

  UserEntity({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    this.uId,
    this.photoUrl,
    this.status,
    this.createdAt,
  });
}
