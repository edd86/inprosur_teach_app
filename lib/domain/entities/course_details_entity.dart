import 'package:flutter/material.dart';
import 'package:inprosur_teach_app/domain/entities/instructor_entity.dart';

class CourseDetailsEntity {
  final int id;
  final String title;
  final String description;
  final double price;
  final bool isPublished;
  final TimeOfDay duration;
  final String thumbnailUrl;
  final String creationDate;
  final bool state;
  final int categoryId;
  final int instructorId;
  final String photoInstructor;
  final InstructorEntity instructor;

  CourseDetailsEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.isPublished,
    required this.duration,
    required this.thumbnailUrl,
    required this.creationDate,
    required this.state,
    required this.categoryId,
    required this.instructorId,
    required this.photoInstructor,
    required this.instructor,
  });
}
