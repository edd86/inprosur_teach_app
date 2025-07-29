import 'package:flutter/material.dart';

class CourseModel {
  int? id;
  String title;
  String description;
  int instructorId;
  int categoryId;
  double price;
  bool isPublished;
  TimeOfDay duration;
  String? thumbnailUrl;
  DateTime creationDate;

  CourseModel({
    this.id,
    required this.title,
    required this.description,
    required this.instructorId,
    required this.categoryId,
    required this.price,
    required this.isPublished,
    required this.duration,
    this.thumbnailUrl,
    required this.creationDate,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    final int minutes = json['duration'] ?? 0;
    final int hours = minutes ~/ 60;
    final int mins = minutes % 60;
    return CourseModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      instructorId: json['instructorId'],
      categoryId: json['categoryId'],
      price: json['price'].toDouble(),
      isPublished: json['isPublished'] == 1 ? true : false,
      duration: TimeOfDay(hour: hours, minute: mins),
      thumbnailUrl: json['thumbnailUrl'],
      creationDate: DateTime.parse(json['creationDate']),
    );
  }
}
