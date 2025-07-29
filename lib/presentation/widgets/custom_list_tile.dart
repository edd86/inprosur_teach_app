import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomListTile extends StatelessWidget {
  final String? src;
  final String title;
  final String subtitle;
  final IconData icon;
  const CustomListTile({
    required this.src,
    required this.title,
    required this.subtitle,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            child: src != null
                ? Image.network(
                    src!,
                    fit: BoxFit.fitWidth,
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset('assets/img/error_horizontal.png'),
                  )
                : SizedBox(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w, child: Icon(icon)),
        ],
      ),
    );
  }
}
