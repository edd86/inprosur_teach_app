class SearchResultsEntity {
  String type;
  int id;
  String title;
  String description;
  String? thumbnailUrl;
  String? url;
  String? fileUrl;

  SearchResultsEntity({
    required this.type,
    required this.id,
    required this.title,
    required this.description,
    this.thumbnailUrl,
    this.url,
    this.fileUrl,
  });
}
