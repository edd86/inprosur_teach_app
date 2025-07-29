import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:inprosur_teach_app/presentation/providers/course_provider.dart';

class RatingCourseWidget extends ConsumerStatefulWidget {
  final int courseId;
  const RatingCourseWidget({required this.courseId, super.key});

  @override
  ConsumerState<RatingCourseWidget> createState() => _RatingCourseWidgetStare();
}

class _RatingCourseWidgetStare extends ConsumerState<RatingCourseWidget> {
  @override
  Widget build(BuildContext context) {
    final ratingAsync = ref.watch(courseRatingProvider(widget.courseId));
    final double starSize = 18.sp;
    return ratingAsync.when(
      data: (rating) {
        int fullStars = rating.floor();
        double reminder = rating - fullStars;
        bool hasHalfStar = reminder >= .5;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(5, (index) {
            if (index < fullStars) {
              return Icon(
                Icons.star,
                color: Colors.yellow[800],
                size: starSize,
              );
            } else if (hasHalfStar && index == fullStars) {
              return Icon(
                Icons.star_half,
                color: Colors.yellow[800],
                size: starSize,
              );
            } else {
              return Icon(
                Icons.star_border,
                color: Colors.yellow[800],
                size: starSize,
              );
            }
          }),
        );
      },
      error: (e, _) => Text('Error: $e'),
      loading: () => Container(height: 3.h, color: Colors.black54),
    );
  }
}
