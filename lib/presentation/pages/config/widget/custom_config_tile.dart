import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomConfigTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String route;
  const CustomConfigTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: SizedBox(
        height: 4.h,
        width: 100.w,
        child: Row(
          children: [
            SizedBox(
              width: 15.w,
              child: Icon(icon, size: 25.sp),
            ),
            SizedBox(width: 0.5.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(subtitle, style: TextStyle(fontSize: 14.5.sp)),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 20.sp),
          ],
        ),
      ),
    );
  }
}
