import 'package:dio/dio.dart';
import 'package:inprosur_teach_app/data/datasources/sources/course_endpoint.dart';
import 'package:inprosur_teach_app/data/mappers/course_mapper.dart';
import 'package:inprosur_teach_app/data/mappers/course_ranking_mapper.dart';
import 'package:inprosur_teach_app/data/models/course_model.dart';
import 'package:inprosur_teach_app/data/models/course_ranking_model.dart';
import 'package:inprosur_teach_app/domain/entities/course_entity.dart';
import 'package:inprosur_teach_app/domain/entities/course_ranking_entity.dart';
import 'package:inprosur_teach_app/domain/repositories/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  @override
  Future<List<CourseRankingEntity>> getRankingCourses() async {
    final dio = Dio();
    final result = await dio.get(getRankingCoursesUrl);
    List<CourseRankingEntity> rankingCourses = [];
    final coursesJson = result.data['data'];
    for (var course in coursesJson) {
      rankingCourses.add(
        CourseRankingMapper.modelToEntity(CourseRankingModel.fromJson(course)),
      );
    }
    return rankingCourses;
  }

  @override
  Future<List<CourseEntity>> getRecentCreated() async {
    final dio = Dio();
    final result = await dio.get(getRecentCreatedUrl);
    List<CourseEntity> courses = [];
    final coursesJson = result.data['data'];
    for (var course in coursesJson) {
      courses.add(CourseMapper.modelToEntity(CourseModel.fromJson(course)));
    }
    return courses;
  }

  @override
  Future<CourseEntity> getCourseById(int id) async {
    final dio = Dio();
    final result = await dio.get(getCourseByIdUrl(id));
    return CourseMapper.modelToEntity(
      CourseModel.fromJson(result.data['data']),
    );
  }

  @override
  Future<String> getCourseInstructor() {
    // TODO: implement getCourseInstructor
    throw UnimplementedError();
  }

  @override
  Future<double> getCourseRating(int id) async {
    final dio = Dio();
    final result = await dio.get(getCourseRatingUrl(id));
    final value = result.data['data']['averageRating'];
    return (value as num).toDouble();
  }
}
