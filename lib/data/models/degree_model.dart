class DegreeModel {
  int? id;
  String name;
  String description;

  DegreeModel({this.id, required this.name, required this.description});

  factory DegreeModel.fromMap(Map<String, dynamic> json) {
    return DegreeModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
