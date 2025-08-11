class LessonEntity {
  final int id;
  final int courseId;
  final String title;
  final String description;
  final double price;

  LessonEntity({
    required this.id,
    required this.courseId,
    required this.title,
    required this.description,
    required this.price,
  });
}
