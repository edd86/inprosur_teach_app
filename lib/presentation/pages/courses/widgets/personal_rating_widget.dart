import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inprosur_teach_app/core/variables/global_variables.dart';
import 'package:inprosur_teach_app/data/repositories/student_repository_impl.dart';
import 'package:inprosur_teach_app/presentation/widgets/warning_dialog.dart';
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
          onTap: () async {
            if (studentLogued != null) {
              final validateEnrollment = await StudentRepositoryImpl()
                  .studentEnrolledInCourse(studentLogued!.id!, widget.courseId);
              if (validateEnrollment.data) {
                setState(() {
                  selectedStar = index;
                });
              } else {
                _showWarning('No ha cursado este curso, no puede calificarlo');
              }
            } else {
              _showWarning('Inicie Sesión para calificar');
            }
          },
        );
      }),
    );
  }

  void _showWarning(String message) {
    showDialog(
      context: context,
      builder: (context) => WarningDialog(message: message),
    );
  }
}
