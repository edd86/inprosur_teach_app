import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inprosur_teach_app/presentation/pages/courses/widgets/rating_course_widget.dart';
import 'package:inprosur_teach_app/presentation/providers/course_provider.dart';
import 'package:sizer/sizer.dart';

class CoursePage extends ConsumerStatefulWidget {
  final int courseId;
  final int instructorId;
  const CoursePage({
    required this.courseId,
    required this.instructorId,
    super.key,
  });

  @override
  ConsumerState<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends ConsumerState<CoursePage> {
  @override
  Widget build(BuildContext context) {
    //TODO: Implementar la lógica para obtener al instructor del curso y todos sus valores; crear su entidad y modelo.
    final courseAsync = ref.watch(courseProvider(widget.courseId));
    return Scaffold(
      appBar: AppBar(
        title: courseAsync.when(
          data: (course) => Text(
            course.title,
            style: TextStyle(
              fontSize: course.title.length >= 25 ? 16.sp : 17.5.sp,
            ),
            maxLines: 2,
          ),
          error: (e, _) => Text('Error'),
          loading: () => SizedBox.shrink(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(3.w, .5.h, 3.w, 0),
        child: Column(
          children: [
            courseAsync.when(
              data: (course) => Image.network(
                course.thumbnailUrl!,
                height: 20.h,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/img/error_horizontal.png');
                },
              ),
              error: (e, _) => Text('Error: $e'),
              loading: () => Container(
                height: 20.h,
                color: Colors.black54,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
            SizedBox(height: 0.5.h),
            SizedBox(
              height: 10.h,
              child: Center(
                child: courseAsync.when(
                  data: (course) => Text(course.description),
                  error: (e, _) => Text('Error: e'),
                  loading: () => SizedBox(),
                ),
              ),
            ),
            SizedBox(height: 0.5.h),
            SizedBox(
              height: 5.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  courseAsync.when(
                    data: (course) => SizedBox(
                      width: 40.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.attach_money_outlined),
                          Text('${course.price.toString()} bs.'),
                        ],
                      ),
                    ),
                    error: (e, _) => Text('Error: e'),
                    loading: () => SizedBox(),
                  ),
                  courseAsync.when(
                    data: (course) => SizedBox(
                      width: 40.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.watch_later_outlined),
                          Text(
                            '${course.duration.hour}:${course.duration.minute < 10 ? '0${course.duration.minute}' : course.duration.minute.toString()}',
                          ),
                        ],
                      ),
                    ),
                    error: (e, _) => Text('Error: e'),
                    loading: () => SizedBox(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Valoración:'),
                RatingCourseWidget(courseId: widget.courseId),
                Text('Califica:'),
                RatingCourseWidget(courseId: widget.courseId),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
