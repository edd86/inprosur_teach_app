class CourseRankingEntity {
  int id;
  String title;
  String description;
  int instructorId;
  String? thumbnailUrl;
  double averageRating;
  int ratingCount;

  CourseRankingEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.instructorId,
    this.thumbnailUrl,
    required this.averageRating,
    required this.ratingCount,
  });
}
