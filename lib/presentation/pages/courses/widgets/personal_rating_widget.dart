import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

class PersonalRatingWidget extends ConsumerStatefulWidget {
  const PersonalRatingWidget({super.key, required this.courseId});
  final int courseId;

  @override
  ConsumerState<PersonalRatingWidget> createState() =>
      _PersonalRatingWidgetState();
}

class _PersonalRatingWidgetState extends ConsumerState<PersonalRatingWidget> {
  int selectedStar = -1;
  @override
  Widget build(BuildContext context) {
    final double starSize = 18.sp;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(5, (index) {
        return GestureDetector(
          child: Icon(
            Icons.star,
            size: starSize,
            color: selectedStar >= index ? Colors.yellow : Colors.grey,
          ),
          onTap: () {
            setState(() {
              selectedStar = index;
            });
          },
        );
      }),
    );
  }
}
