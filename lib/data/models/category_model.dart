class CategoryModel {
  int? id;
  String name;
  int degreeId;

  CategoryModel({this.id, required this.name, required this.degreeId});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      degreeId: json['degreeId'],
    );
  }
}
