import 'package:flutter/material.dart';

class CourseEntity {
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

  CourseEntity({
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
}
