import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonalRatingWidget extends ConsumerStatefulWidget {
  const PersonalRatingWidget({super.key});

  @override
  ConsumerState<PersonalRatingWidget> createState() =>
      _PersonalRatingWidgetState();
}

class _PersonalRatingWidgetState extends ConsumerState<PersonalRatingWidget> {
  //TODO: Icon Buttons for student to set a rating to the course.
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
