import 'package:dio/dio.dart';
import 'package:inprosur_teach_app/data/datasources/sources/lessons_endpoints.dart';
import 'package:inprosur_teach_app/data/mappers/lesson_mapper.dart';
import 'package:inprosur_teach_app/data/models/lesson_model.dart';
import 'package:inprosur_teach_app/domain/entities/lesson_entity.dart';
import 'package:inprosur_teach_app/domain/repositories/lesson_repository.dart';

class LessonRepositoryImp implements LessonRepository {
  @override
  Future<List<LessonEntity>> getAvialableLessonsInCourse(int courseId) async {
    final dio = Dio();
    final res = await dio.get(getAvialableLessonsInCourseUrl(courseId));
    final List<LessonEntity> lessons = (res.data['data'] as List)
        .map((e) => LessonMapper.toEntity(LessonModel.fromJson(e)))
        .toList();
    return lessons;
  }
}
