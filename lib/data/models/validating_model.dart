class ValidatingModel {
  final bool success;
  final bool data;
  final String message;

  ValidatingModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory ValidatingModel.fromJson(Map<String, dynamic> json) {
    return ValidatingModel(
      success: json['success'],
      data: json['data'],
      message: json['message'],
    );
  }
}
