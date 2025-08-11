import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inprosur_teach_app/core/utils/utils.dart';
import 'package:inprosur_teach_app/presentation/pages/courses/widgets/course_content_widget.dart';
import 'package:inprosur_teach_app/presentation/pages/courses/widgets/personal_rating_widget.dart';
import 'package:inprosur_teach_app/presentation/pages/courses/widgets/rating_course_widget.dart';
import 'package:inprosur_teach_app/presentation/providers/course_provider.dart';
import 'package:sizer/sizer.dart';

class CoursePage extends ConsumerStatefulWidget {
  final int courseId;
  const CoursePage({required this.courseId, super.key});

  @override
  ConsumerState<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends ConsumerState<CoursePage> {
  @override
  Widget build(BuildContext context) {
    final courseAsync = ref.watch(courseDetailsProvider(widget.courseId));

    return courseAsync.when(
      data: (courseDetails) => Scaffold(
        appBar: AppBar(
          title: Text(
            courseDetails.title,
            style: TextStyle(
              fontSize: courseDetails.title.length >= 25 ? 16.sp : 17.5.sp,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(3.w, .5.h, 3.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(courseDetails.thumbnailUrl, height: 20.h),
              SizedBox(height: 0.5.h),
              SizedBox(
                width: 100.w,
                height: 7.5.h,
                child: Center(
                  child: Text(
                    courseDetails.description,
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    style: TextStyle(fontSize: 13.5.sp),
                  ),
                ),
              ),
              SizedBox(height: 0.5.h),
              SizedBox(
                height: 5.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 40.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.attach_money),
                          Text('${courseDetails.price.toString()} bs.'),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.watch_later_outlined),
                          Text(Utils().timeToString(courseDetails.duration)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: .5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Valoración: ',
                    style: TextStyle(
                      fontSize: 13.5.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RatingCourseWidget(courseId: widget.courseId),
                  Text(
                    'Califica:',
                    style: TextStyle(
                      fontSize: 13.5.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  PersonalRatingWidget(courseId: widget.courseId),
                ],
              ),
              SizedBox(height: .5.h),
              Card(
                elevation: 2.5.sp,
                child: SizedBox(
                  height: 12.5.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.sp),
                        child: Image.network(courseDetails.photoInstructor),
                      ),
                      SizedBox(
                        width: 60.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 0.7.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                courseDetails.instructor.name,
                                style: TextStyle(
                                  fontSize: 14.5.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                                child: Text(
                                  courseDetails.instructor.biography,
                                  style: TextStyle(fontSize: 12.5.sp),
                                  maxLines: null,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: CourseContentWidget(courseId: widget.courseId)),
              ElevatedButton.icon(
                label: Text('COMPRAR CURSO'),
                icon: Icon(Icons.sell),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      error: (e, _) => Center(child: Text('Error: $e')),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
