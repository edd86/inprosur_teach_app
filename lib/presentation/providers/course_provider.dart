import 'package:inprosur_teach_app/data/repositories/course_repository_impl.dart';
import 'package:inprosur_teach_app/domain/entities/course_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final courseProvider = FutureProvider.family<CourseEntity, int>((
  ref,
  courseId,
) async {
  return await CourseRepositoryImpl().getCourseById(courseId);
});

final courseRatingProvider = FutureProvider.family<double, int>((
  ref,
  courseId,
) async {
  return await CourseRepositoryImpl().getCourseRating(courseId);
});
