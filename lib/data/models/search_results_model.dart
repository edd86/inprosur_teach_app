class SearchResultsModel {
  String type;
  int id;
  String title;
  String description;
  String? thumbnailUrl;
  String? url;
  String? fileUrl;

  SearchResultsModel({
    required this.type,
    required this.id,
    required this.title,
    required this.description,
    this.thumbnailUrl,
    this.url,
    this.fileUrl,
  });

  factory SearchResultsModel.fromMap(Map<String, dynamic> json) {
    return SearchResultsModel(
      type: json['type'],
      id: json['id'],
      title: json['title'],
      description: json['description'],
      thumbnailUrl: json['thumbnailUrl'],
      url: json['url'],
      fileUrl: json['fileUrl'],
    );
  }
}
