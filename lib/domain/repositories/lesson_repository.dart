import 'package:inprosur_teach_app/domain/entities/lesson_entity.dart';

abstract class LessonRepository {
  Future<List<LessonEntity>> getAvialableLessonsInCourse(int courseId);
}
