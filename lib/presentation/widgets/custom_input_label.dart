import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inprosur_teach_app/core/constants/app_theme.dart';
import 'package:inprosur_teach_app/presentation/providers/theme_provider.dart';
import 'package:sizer/sizer.dart';

class CustomInputLabel extends ConsumerWidget {
  final IconData icon;
  final String label;
  const CustomInputLabel({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(themeProvider);
    final double dim = label.length <= 10
        ? label.length * 2.8
        : label.length * 2.3;
    return SizedBox(
      width: dim.w,
      child: Row(
        children: [
          Icon(
            icon,
            color: res ? AppTheme().primaryDark : AppTheme().primaryLight,
          ),
          SizedBox(width: 1.w),
          Text(label),
        ],
      ),
    );
  }
}
