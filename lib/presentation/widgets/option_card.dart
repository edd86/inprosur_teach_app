import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OptionCard extends StatefulWidget {
  final String text;
  const OptionCard({required this.text, super.key});

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.blue,
      child: SizedBox(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Text(
              widget.text,
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
