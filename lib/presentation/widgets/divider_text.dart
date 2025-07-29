import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DividerText extends StatelessWidget {
  final String text;
  const DividerText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider(thickness: 5.sp, endIndent: 10)),
        SizedBox(width: 3.w),
        Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(width: 3.w),
        Expanded(child: Divider(thickness: 5.sp, endIndent: 10)),
      ],
    );
  }
}
