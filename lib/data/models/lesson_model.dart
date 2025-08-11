class LessonModel {
  final int id;
  final int courseId;
  final String title;
  final String description;
  final double price;

  LessonModel({
    required this.id,
    required this.courseId,
    required this.title,
    required this.description,
    required this.price,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) => LessonModel(
    id: json['id'],
    courseId: json['courseId'],
    title: json['title'],
    description: json['description'],
    price: json['price'].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'courseId': courseId,
    'title': title,
    'description': description,
    'price': price,
  };
}

/* "id": 1,
      "courseId": 1,
      "title": "Leccion 1",
      "description": "Introducción",
      "price": 7 */
