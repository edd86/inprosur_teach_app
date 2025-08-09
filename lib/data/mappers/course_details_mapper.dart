import 'package:inprosur_teach_app/data/models/course_details_model.dart';
import 'package:inprosur_teach_app/domain/entities/course_details_entity.dart';
import 'package:inprosur_teach_app/domain/entities/instructor_entity.dart';

class CourseDetailsMapper {
  static CourseDetailsEntity toEntity(CourseResponse model) {
    return CourseDetailsEntity(
      id: model.data.id,
      title: model.data.title,
      description: model.data.description,
      price: model.data.price,
      isPublished: model.data.isPublished,
      duration: model.data.duration,
      thumbnailUrl: model.data.thumbnailUrl,
      creationDate: model.data.creationDate,
      state: model.data.state,
      categoryId: model.data.categoryId,
      instructorId: model.data.instructorId,
      photoInstructor: model.data.photoInstructor,
      instructor: InstructorEntity(
        id: model.data.instructor.id,
        name: model.data.instructor.name,
        biography: model.data.instructor.biography,
        phone: model.data.instructor.phone,
        createdAt: model.data.instructor.createdAt,
        userId: model.data.instructor.userId,
      ),
    );
  }

  static CourseDetailsModel toModel(CourseDetailsEntity entity) {
    return CourseDetailsModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      price: entity.price,
      isPublished: entity.isPublished,
      duration: entity.duration,
      thumbnailUrl: entity.thumbnailUrl,
      creationDate: entity.creationDate,
      state: entity.state,
      categoryId: entity.categoryId,
      instructorId: entity.instructorId,
      photoInstructor: entity.photoInstructor,
      instructor: InstructorModel(
        id: entity.instructor.id,
        name: entity.instructor.name,
        biography: entity.instructor.biography,
        phone: entity.instructor.phone,
        createdAt: entity.instructor.createdAt,
        userId: entity.instructor.userId,
      ),
    );
  }
}
