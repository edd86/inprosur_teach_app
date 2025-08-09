import 'package:flutter/material.dart';
import 'package:inprosur_teach_app/domain/entities/course_entity.dart';
import 'package:inprosur_teach_app/domain/entities/course_ranking_entity.dart';
import 'package:sizer/sizer.dart';

class CoursesHomeCard extends StatelessWidget {
  final CourseRankingEntity? courseRanking;
  final CourseEntity? courseEntity;
  const CoursesHomeCard({
    this.courseRanking,
    this.courseEntity,
    required super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 16.h,
        width: 44.5.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                topLeft: Radius.circular(15.sp),
                topRight: Radius.circular(15.sp),
              ),
              child: Center(
                child: courseRanking != null
                    ? Image.network(
                        courseRanking!.thumbnailUrl!,
                        height: 10.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset('assets/imgs/error_horizontal.png'),
                      )
                    : Image.network(
                        courseEntity!.thumbnailUrl!,
                        height: 10.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset('assets/imgs/error_horizontal.png'),
                      ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 0.5.h),
                  SizedBox(
                    width: 42.w,
                    child: Text(
                      courseRanking != null
                          ? courseRanking!.title
                          : courseEntity!.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  SizedBox(
                    width: 42.w,
                    child: Text(
                      courseRanking != null
                          ? courseRanking!.description
                          : courseEntity!.description,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 10.5.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
