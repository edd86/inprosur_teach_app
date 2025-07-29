import 'package:inprosur_teach_app/domain/entities/course_entity.dart';
import 'package:inprosur_teach_app/domain/entities/course_ranking_entity.dart';

abstract class CourseRepository {
  Future<List<CourseRankingEntity>> getRankingCourses();
  Future<List<CourseEntity>> getRecentCreated();
  Future<CourseEntity> getCourseById(int id);
  Future<double> getCourseRating(int id);
  Future<String> getCourseInstructor();
}
