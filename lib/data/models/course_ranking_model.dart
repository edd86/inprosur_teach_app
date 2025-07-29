class CourseRankingModel {
  int id;
  String title;
  String description;
  int instructorId;
  String? thumbnailUrl;
  double averageRating;
  int ratingCount;

  CourseRankingModel({
    required this.id,
    required this.title,
    required this.description,
    required this.instructorId,
    this.thumbnailUrl,
    required this.averageRating,
    required this.ratingCount,
  });

  factory CourseRankingModel.fromJson(Map<String, dynamic> json) {
    return CourseRankingModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      instructorId: json['instructorId'],
      thumbnailUrl: json['thumbnailUrl'],
      averageRating: (json['averageRating'] ?? 0).toDouble(),
      ratingCount: json['ratingCount'] ?? 0,
    );
  }
}
