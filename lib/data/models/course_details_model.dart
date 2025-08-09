import 'package:flutter/material.dart';

class CourseResponse {
  final bool success;
  final CourseDetailsModel data;
  final String message;

  CourseResponse({
    required this.success,
    required this.data,
    required this.message,
  });

  factory CourseResponse.fromJson(Map<String, dynamic> json) {
    return CourseResponse(
      success: json['success'],
      data: CourseDetailsModel.fromJson(json['data']),

      message: json['message'],
    );
  }
}

class CourseDetailsModel {
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
  final InstructorModel instructor;

  CourseDetailsModel({
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

  factory CourseDetailsModel.fromJson(Map<String, dynamic> json) {
    final int minutes = json['duration'] ?? 0;
    final int hours = minutes ~/ 60;
    final int mins = minutes % 60;
    return CourseDetailsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      isPublished: json['isPublished'],
      duration: TimeOfDay(hour: hours, minute: mins),
      thumbnailUrl: json['thumbnailUrl'],
      creationDate: json['creationDate'],
      state: json['state'],
      categoryId: json['categoryId'],
      instructorId: json['instructorId'],
      photoInstructor: json['photoInstructor'],
      instructor: InstructorModel.fromJson(json['instructor']),
    );
  }
}

class InstructorModel {
  final int id;
  final String name;
  final String biography;
  final String phone;
  final String createdAt;
  final int userId;

  InstructorModel({
    required this.id,
    required this.name,
    required this.biography,
    required this.phone,
    required this.createdAt,
    required this.userId,
  });

  factory InstructorModel.fromJson(Map<String, dynamic> json) {
    return InstructorModel(
      id: json['id'],
      name: json['name'],
      biography: json['biography'],
      phone: json['phone'],
      createdAt: json['createdAt'],
      userId: json['userId'],
    );
  }
}
