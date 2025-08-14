import 'package:flutter/material.dart';
import 'package:inprosur_teach_app/data/repositories/lesson_repository_imp.dart';
import 'package:inprosur_teach_app/domain/entities/lesson_entity.dart';
import 'package:sizer/sizer.dart';

class CourseContentWidget extends StatefulWidget {
  final int courseId;
  const CourseContentWidget({required this.courseId, super.key});

  @override
  State<CourseContentWidget> createState() => _CourseContentWidgetState();
}

class _CourseContentWidgetState extends State<CourseContentWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: LessonRepositoryImp().getAvialableLessonsInCourse(
        widget.courseId,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        final lessons = snapshot.data as List<LessonEntity>;
        return ListView.builder(
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              initiallyExpanded: false,
              leading: Icon(Icons.school),
              title: Text(
                lessons[index].title,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                lessons[index].description,
                style: TextStyle(fontSize: 13.sp),
              ),
            );
          },
        );
      },
    );
  }
}
